class CreateInspection < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.datetime :date
      t.integer  :inspection_type_id

      t.timestamps null: false
    end
  end
end
