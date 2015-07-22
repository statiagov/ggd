class ChangeFacilityTypeName < ActiveRecord::Migration
  def change
    rename_column :facility_types, :type_name, :name
  end
end
