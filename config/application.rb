require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Meucasamento
  class Application < Rails::Application

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.generators do |g|
      g.helper_specs false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators.test_framework = :rspec
    config.generators.fixture_replacement :factory_girl
  end
end
