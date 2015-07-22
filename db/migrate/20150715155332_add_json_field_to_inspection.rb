class AddJsonFieldToInspection < ActiveRecord::Migration
  def change
    add_column :inspections, :data, :jsonb, null: false, default: '{}'
  end
end
