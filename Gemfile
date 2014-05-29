source 'https://rubygems.org'

ruby '2.1.1'

ENV['NOKOGIRI_USE_SYSTEM_LIBRARIES'] = 'YES'

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-sass', '~> 3.1.1.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '= 2.2.1' # jquery-1.9.1 see https://github.com/rails/jquery-rails/blob/master/VERSIONS.md
gem 'therubyracer'
gem 'sqlite3'

gem 'i18n'
gem 'i18n_generators'

group :development, :test do
#  gem 'sqlite3'
  gem 'guard-coffeescript'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
#  gem 'childprocess', '0.5.2'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'factory_girl_rails'

  gem 'coveralls', :require => false
  gem 'simplecov', '~> 0.7.1', :require => false, :group => :test

#  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

gem 'capistrano', '~> 3.1.0'
gem 'capistrano-rails', '~> 1.1.0' # rails specific capistrano funcitons
gem 'capistrano-bundler'           # integrate bundler with capistrano
gem 'capistrano-rbenv', "~> 2.0"   # if you are using RBENV
gem 'unicorn'
