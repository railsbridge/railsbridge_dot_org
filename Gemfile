source "https://rubygems.org"

ruby "2.2.2"

gem "rails", "4.2.1"
gem "thin"
gem "haml-rails"
gem "jquery-rails"
gem "font-awesome-rails"
gem "twitter"
gem "tweetstream"
gem "activeresource"

gem "sass-rails"
gem "coffee-rails"
gem "bootstrap-sass"
gem "uglifier",     ">= 1.0.3"
gem "bourbon"

# Site Tools & Monitoring
gem "sitemap_generator"

group :production do
  gem "newrelic_rpm"
  gem "pg"
  gem "rails_12factor"
  gem "google-analytics-rails", "~> 0.0.4"
end

group :test, :development do
  gem "sqlite3"

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
  gem "awesome_print"
  gem "pry-byebug"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end
