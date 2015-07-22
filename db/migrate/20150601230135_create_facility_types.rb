class CreateFacilityTypes < ActiveRecord::Migration
  def change
    create_table :facility_types do |t|
      t.string :type_name , length:50
      t.string :description, length:255
    end
  end
end
