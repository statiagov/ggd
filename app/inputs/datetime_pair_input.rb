
class DatetimePairInput < DatePairInput
  private

  # Tell datepicker this is a datetime
  #------------------------------------------------------------------------------
  def input_html_classes
    classes = super.dup
    classes.delete('date')
    classes.push('datetime')
  end

  # Return value recognised by datepicker and ensure timezone properly set by AR
  #------------------------------------------------------------------------------
  def value(field)
    val = object.send(field.name)
    val.present? ? val.strftime('%Y-%m-%d %H:%M') : nil
  end

  ActiveSupport.run_load_hooks(:statia_gov_datetime_pair_input, self)
end
