

module StatiaGov
  class << self
    # Return either Application or Engine,
    # depending on how Fat Free CRM has been loaded
    def application
      engine? ? Engine : Application
    end

    delegate :root, to: :application

    # Are we running as an engine?
    def engine?
      defined?(StatiaGov::Engine).present?
    end

    def application?
      !engine?
    end
  end
end

# Load Fat Free CRM as a Rails Engine, unless running as a Rails Application
unless defined?(StatiaGov::Application)
  require 'statia_gov/engine'
end

require 'statia_gov/load_settings' # register load hook for Setting

# Require gem dependencies, monkey patches, and vendored plugins (in lib)
require "statia_gov/gem_dependencies"
require "statia_gov/gem_ext"

require "statia_gov/custom_fields" # load hooks for Field
require "statia_gov/version"
require "statia_gov/core_ext"
require "statia_gov/comment_extensions"
require "statia_gov/exceptions"
require "statia_gov/export_csv"
require "statia_gov/errors"
require "statia_gov/i18n"
require "statia_gov/permissions"
require "statia_gov/exportable"
require "statia_gov/renderers"
require "statia_gov/fields"
require "statia_gov/sortable"
require "statia_gov/tabs"
require "statia_gov/callback"
require "statia_gov/view_factory"
require "statia_gov/forms"
require "statia_gov/services"

require "country_select"
require "gravatar_image_tag"
