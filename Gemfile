source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Bootstrap CSS Framework
gem 'bootstrap-sass'
# Use Font Awesome for styling icons
gem 'font-awesome-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'thor', '0.20.0'
# Use Devise for User Authentication
gem 'devise'
# Handle Sensitive Config Data
gem 'figaro', '1.0'
# Create fake data to seed the database with using Faker
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
# Use Stripe for payment services
gem 'stripe'
# Use Redcarpet for markdown syntax
gem 'redcarpet'
# Use Pundit gem for authorization
gem 'pundit'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development, :test do
	gem 'rspec-rails', '~> 3.0'
	gem 'rails-controller-testing'
end

group :production do
  # Use pg as the production database for Active Record
  gem 'pg', '~> 0.21'
  gem 'rails_12factor'
end