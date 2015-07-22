
module StatiaGov
  class MissingSettings < StandardError; end
  class ObsoleteSettings < StandardError; end
end

class ActionController::Base
  rescue_from StatiaGov::MissingSettings,  with: :render_statia_gov_exception
  rescue_from StatiaGov::ObsoleteSettings, with: :render_statia_gov_exception

  private

  def render_statia_gov_exception(exception)
    logger.error exception.inspect
    render layout: false, template: "/layouts/500", format: :html, status: 500, locals: { exception: exception }
  end
end
