

#
# Register CustomFields when Field class is loaded
ActiveSupport.on_load(:statia_gov_field) do # self == Field
  register(as: 'date_pair', klass: 'CustomFieldDatePair', type: 'date')
  register(as: 'datetime_pair', klass: 'CustomFieldDatetimePair', type: 'timestamp')
end
