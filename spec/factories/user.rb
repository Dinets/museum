# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    confirmed_at { Time.zone.now }
    role { 'user' }

    trait :admin do
      role { 'admin' }
    end

    trait :author do
      role { 'author' }
    end
  end
end
