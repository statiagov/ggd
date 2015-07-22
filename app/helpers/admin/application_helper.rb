
module Admin::ApplicationHelper
  #----------------------------------------------------------------------------
  def link_to_confirm_delete(model)
    link_to(t(:yes_button),
            url_for([:admin, model]),
            method:  :delete,
            remote:  true
    )
  end
end
