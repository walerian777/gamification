source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

gem 'cancancan'
gem 'chartkick'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.2'
gem 'devise-encryptable'
gem 'devise_invitable', '~> 1.7.0'
gem 'groupdate'
gem 'haml', '~> 4.0.7'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth'
# gem 'omniauth-twitter'
# gem 'omniauth-facebook'
# gem 'omniauth-linkedin'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'redis', '~>3.2'
gem 'redis-objects'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate-bootstrap'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.5', require: 'rspec/rails'
end

group :development do
  gem 'awesome_rails_console'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
