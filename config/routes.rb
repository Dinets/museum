# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper

  root 'pages#main'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }

  scope (':locale'), locale: /#{I18n.available_locales.join('|')}/, defaults: { locale: I18n.locale } do
    root 'pages#main', as: :root_with_locale

    resources :posts, only: %i[index show new create] do
      resources :comments
    end
    resources :users, only: %i[show]

    get 'comparison/1782_1943', to: 'comparison#_1782_1943'
    get 'comparison/1943_2017', to: 'comparison#_1943_2017'
    get 'comparison',           to: 'comparison#index'
    get 'comparison/1782_2017', to: 'comparison#_1782_2017'
    get 'maps/1782',            to: 'maps#map_1782'

    namespace :admin do
      post 'markdown/preview'
      get 'main', to: 'admin#main'
      resources :posts do
        resources :comments
      end
      resources :comments
      resources :users
    end

    namespace :api do
      namespace :v1 do
        resources :posts, shallow: true, only: %i[index show create] do
          resources :comments, only: %i[index show create]
        end
      end
    end

    mount ActionCable.server => '/cable'
  end
end
