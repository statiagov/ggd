
# Set relative url root for assets

if Setting.base_url.present?
  ActionController::Base.relative_url_root = Setting.base_url
end
