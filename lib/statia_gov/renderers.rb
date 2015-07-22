
ActionController::Renderers.add :csv do |objects, options|
  filename = options[:filename] || controller_name || 'data'
  str = StatiaGov::ExportCSV.from_array(objects)
  send_data str, type: :csv,
                 disposition: "attachment; filename=#{filename}.csv"
end
