
module Admin::TagsHelper
  def link_to_confirm(tag)
    link_to(t(:delete) + "?", confirm_admin_tag_path(tag), method: :get, remote: true)
  end
end
