source 'https://rubygems.org'

ruby '~> 3.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier'
gem 'terser'

gem 'bootsnap', require: false

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma', '>= 6.4.2'

gem 'awesome_print'

group :development, :test do
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'listen'

  gem 'rspec_junit_formatter'

  # monitoring
  # gem 'bullet'
  gem 'rack-mini-profiler', require: false
  gem 'flamegraph'
  gem 'stackprof'
  gem 'memory_profiler'

  gem 'webmock'

  # A UI development environment for Ruby on Rails apps
  gem 'lookbook', '>= 2.2.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 4.0'

  gem 'letter_opener'

  # Debugging functionality for Ruby
  gem 'debug', '>= 1.0.0'
end

group :test do
  gem 'vcr'
end

# Heroku fix
group :production do
  gem 'rack-timeout'
  gem 'font_assets'
end

# file uploades & assets
gem 'aws-sdk-s3', require: false

# caching
gem 'dalli' # memcache
gem 'rack-cache' # http caching

# sidekiq
gem 'sidekiq'

# NOTE: jsbundling-rails and turbo-rails are prerequisites for spree_frontend.
# Bundle and transpile JavaScript in Rails with esbuild, rollup.js, or Webpack.
gem 'jsbundling-rails'

# Use Turbo in your Ruby on Rails app
gem 'turbo-rails'

# Spree gems
# A complete open source e-commerce solution with multi-store, multi-currency
# and multi-language capabilities
gem 'spree', '~> 4.7.0'

# Spree Models, Helpers, Services and core libraries
gem 'spree_core', '~> 4.7.0'

# Spree's API
gem 'spree_api', '~> 4.7.0'

# Optional package containing example data of products, stores,
# shipping methods, categories and others to quickly setup a demo Spree store
gem 'spree_sample', '~> 4.7.0'

# Optional transactional emails for Spree such as Order placed or Shipment notification emails
gem 'spree_emails', '~> 4.7.0'

# Spree Admin Dashboard
gem 'spree_backend', '~> 4.7.0'

# Huge collection of payment gateways for Spree. Stripe, Braintree, Apple Pay, Authorize.net and many others!
gem 'spree_gateway', '~> 3.10.0'

# Old Spree Storefront extracted from Spree < 4.3 which was upgraded to Turbo/Hotwire.
gem 'spree_frontend'

# Provides authentication (user accounts, login & signup) for Spree by using Devise
gem 'spree_auth_devise', '~> 4.6.0'

# I18n translation files for Spree Commerce.
gem 'spree_i18n', '~> 5.3.0'

# Spree Developer Tools
gem 'spree_dev_tools', require: false, group: %w[test development]

# Spree marketplace extension. Create your own marketplace on top of Spree Commerce
gem 'spree_multi_vendor'

# A RuboCop extension focused on enforcing Rails best practices and coding conventions.
gem 'rubocop-rails', require: false, group: %w[test development]

# An extension of RuboCop focused on code performance checks.
gem 'rubocop-performance', require: false, group: %w[test development]

# A static analysis security vulnerability scanner for Ruby on Rails applications
gem 'brakeman', require: false, group: %w[test development]

# Patch-level verification for Bundler
gem 'bundle-audit', require: false, group: %w[test development]

# Configurable tool for analyzing Slim templates
gem 'slim_lint', require: false, group: %w[test development]

# Intelligent search made easy
gem 'searchkick'

# Ruby Client for OpenSearch
gem 'opensearch-ruby'

# Rack CORS Middleware
gem 'rack-cors'

# SendGrid
gem 'sendgrid-actionmailer'

# logging
gem 'remote_syslog_logger'

gem 'activerecord-nulldb-adapter'

# improved JSON rendering performance
gem 'oj'

# Fix SCSS errors with Ruby 3 on MacOS
gem 'sassc', github: 'sass/sassc-ruby', group: :development

# Use Redis for Action Cable
gem 'redis', '~> 4.0'

# Tailwind CSS for Rails
gem 'tailwindcss-rails', '~> 2.3'

# A framework for building reusable, testable & encapsulated view components in Ruby on Rails.
gem 'view_component'
