
class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input(wrapper_options)
    add_autocomplete!
    input_html_options.merge(input_options)
    input_html_options.merge!(value: value)
    @builder.text_field(attribute_name, merge_wrapper_options(input_html_options, wrapper_options))
  end

  def label_target
    attribute_name
  end

  private

  def has_required?
    options[:required]
  end

  def add_autocomplete!
    input_html_options[:autocomplete] ||= 'off'
  end

  # Serialize into a value recognised by datepicker, also sorts out timezone conversion
  #------------------------------------------------------------------------------
  def value
    val = object.send(attribute_name)
    val.present? ? val.strftime('%Y-%m-%d %H:%M') : nil
  end

  ActiveSupport.run_load_hooks(:statia_gov_date_time_input, self)
end
