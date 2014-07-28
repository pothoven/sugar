source 'http://rubygems.org'
source 'http://gems.github.com'
ruby "1.9.3"

gem 'rails', '~> 3.2'
gem 'jquery-rails'
gem 'power_enum'                           # replaces enumerations_mixin plugin
gem 'newrelic_rpm'
gem 'thin'

group :development, :test do
  gem 'taps'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.0"
  gem 'uglifier'
end

group :production do
  gem 'pg'
end
