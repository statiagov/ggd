# Be sure to restart your server when you modify this file.

if StatiaGov.application?
  Rails.application.config.session_store :cookie_store, key: '_statia_gov_session'
end
