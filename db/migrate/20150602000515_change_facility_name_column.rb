class ChangeFacilityNameColumn < ActiveRecord::Migration
  def change
    rename_column :facilities , :facility_name , :name
  end
end
