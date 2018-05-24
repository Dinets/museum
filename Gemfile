source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers'
gem 'cancancan', '~> 2.0'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'execjs'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'nested_form'
gem 'omniauth'
gem 'omniauth-facebook', '~> 5.0.0 '
gem 'omniauth-google-oauth2', '~> 0.5.3'
gem 'paperclip'
gem 'pg', '~> 0.18'
gem 'pg_search'
gem 'puma'
gem 'rails', '~> 5.0.1'
gem 'rails-i18n', '~> 5.0.0'
gem 'redcarpet'
gem 'remotipart'
gem 'sass-rails', '~> 5.0'
gem 'sentry-raven'
gem 'skim'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'html2slim'
  gem 'listen',                '~> 3.0.5'
  gem 'rubocop',               '~> 0.49.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console',           '>= 3.3.0'
end

group :development, :test do
  gem 'bundle-audit'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'i18n-tasks', '~> 0.9.20'
  gem 'letter_opener'
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
end
ruby '2.4.1'
