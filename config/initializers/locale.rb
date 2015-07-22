

# Set default locale from Settings
# defer setting the locale until all I18n locales have been initialized
#------------------------------------------------------------------------------

# Turn off until https://github.com/rails/rails/issues/13164 is fixed
I18n.config.enforce_available_locales = false
Rails.application.config.i18n.fallbacks = true

StatiaGov.application.config.after_initialize do
  I18n.default_locale = Setting.locale
  I18n.fallbacks[:en] = [:"en-US"]
end
