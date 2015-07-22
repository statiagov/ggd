class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :facility_name, length: 100
      t.string :address , length: 100

      t.timestamps null: false
    end
  end
end
