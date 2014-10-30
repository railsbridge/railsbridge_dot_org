source "https://rubygems.org"

ruby "2.0.0"

gem "rails", "4.1.6"
gem "thin"
gem "haml-rails"
gem "jquery-rails"
gem "font-awesome-rails", "~> 3.2.1.2"
gem "twitter"
gem "tweetstream"
gem "activeresource"

gem "sass-rails"
gem "coffee-rails"
gem "bootstrap-sass-rails", "~> 2.3.2.0"
gem "uglifier",     ">= 1.0.3"
gem "bourbon"

# Site Tools & Monitoring
gem "newrelic_rpm"
gem "sitemap_generator"

group :production do
  gem "pg"
  gem "rails_12factor"
  gem "google-analytics-rails", "~> 0.0.4"
end

group :test, :development do
  gem "sqlite3"
  gem "sextant"

  # Testing
  gem "rspec-rails"
  gem "capybara"
  gem "email_spec"
  gem "shoulda-matchers"

  # Test Tools
  gem "simplecov", :require => false
  gem "timecop"

  # Debugging Tools
  gem "quiet_assets"
  gem "jazz_hands"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman"
end
