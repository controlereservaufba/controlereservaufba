require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Controlereservaufba
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
   config.i18n.default_locale = :'pt-BR'
    config.load_defaults 5.1
    

  end


end
