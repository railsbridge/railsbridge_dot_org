require_relative 'boot'

# Pick the frameworks you want:
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module RailsbridgeSite2013
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set custom 404 and 500 actions in routes.rb
    config.exceptions_app = routes

    # Generator configuration
    config.generators do |g|
      g.assets = false
      g.helper = false
      g.test_framework :rspec, fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
