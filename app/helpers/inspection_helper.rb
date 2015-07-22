
module InspectionHelper
  # Sidebar checkbox control for filtering campaigns by status.
  #----------------------------------------------------------------------------
  def inspection_status_checkbox(status, count)
    entity_filter_checkbox(:status, status, count)
  end

  # Sidebar radiobox control for filtering campaigns by status.
  #----------------------------------------------------------------------------
  def inspection_status_radiobox(status, count)
    entity_filter_radiobox(:status, status, count)
  end



  #----------------------------------------------------------------------------
  def performance(actual, target)
    if target.to_i > 0 && actual.to_i > 0
      if target > actual
        n = 100 - actual * 100 / target
        html = content_tag(:span, "(-#{number_to_percentage(n, precision: 1)})", class: "warn")
      else
        n = actual * 100 / target - 100
        html = content_tag(:span, "(+#{number_to_percentage(n, precision: 1)})", class: "cool")
      end
    end
    html || ""
  end

  # Quick campaign summary for RSS/ATOM feeds.
  #----------------------------------------------------------------------------
  def inspection_summary(inspection)
    status  = render file: "inspections/_status.html.haml",  locals: { inspection: inspection }
    metrics = render file: "inspections/_metrics.html.haml", locals: { campaign: inspection }
    "#{t(inspection.state_machine.current_state)}, " << [status, metrics].map { |str| strip_tags(str) }.join(' ').gsub("\n", '')
  end
end
