
require File.expand_path('../boot', __FILE__)

require 'rubygems'

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# require "rails/test_unit/railtie"
#
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Override Rails Engines so that plugins have higher priority than the Application
require 'statia_gov/gem_ext/rails/engine'

module StatiaGov
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Models are organized in sub-directories
    config.autoload_paths += Dir[Rails.root.join("app/models/**")] +
                             Dir[Rails.root.join("app/controllers/entities")] +
                             Dir[Rails.root.join("app")]



    # Activate observers that should always be running.
    unless ARGV.join.include?('assets:precompile')
      # config.active_record.observers = :task_observer, :entity_observer
    end

    # Load development rake tasks (RSpec, Gem packaging, etc.)
    rake_tasks do
      Dir.glob(Rails.root.join('lib', 'development_tasks', '*.rake')).each { |t| load t }
    end

    # Add migrations from all engines
    # Railties.engines.each do |engine|
    #   # config.paths['db/migrate'] += engine.paths['db/migrate'].existent
    # end

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_hash, :password_salt, :password_confirmation]

    config.active_record.raise_in_transactional_callbacks = true
  end
end

# Require statia_gov after StatiaGov::Application class is defined,
# so that StatiaGov::Engine is skipped.
require 'statia_gov'
