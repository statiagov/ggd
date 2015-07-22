
class TextInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    @builder.text_area(attribute_name, { rows: 7 }.merge(merge_wrapper_options(input_html_options, wrapper_options)))
  end

  ActiveSupport.run_load_hooks(:statia_gov_text_input, self)
end
