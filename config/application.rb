require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'action_controller/railtie'
require 'action_mailer/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Meetme
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.api_only = false

    config.generators do |g|
      g.factory_girl false
    end
  end
end
