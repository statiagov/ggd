class AddFacilityIdToInspection < ActiveRecord::Migration
  def change
    add_column :inspections, :facility_id, :integer
    add_foreign_key :inspections, :facilities, on_delete: :cascade
  end
end
