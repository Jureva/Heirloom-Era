source 'https://rubygems.org'

ruby '2.6.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.3'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3' 
# Use SCSS for stylesheets
gem 'bootstrap-sass', '3.4.1'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '= 4.1.19'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sprockets', '~>3.7.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem "nokogiri", ">= 1.8.2"
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.13'
gem 'faker',          '1.6.6'
gem 'carrierwave'
gem 'mini_magick',             '4.9.4'
gem 'fog',                     '1.38.0'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'therubyracer'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3','1.3.11'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug','9.0.0', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '3.7.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg','~> 0.18.4'
  gem 'rails_12factor', '~> 0.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
 # gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
