class AddDurtionAndEndDateToInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :end_date, :datetime
    rename_column :inspections, :date,  :start_date
    change_column :inspections, :start_date, :datetime, :null => false
  end
end
