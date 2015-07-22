class RemoveNameFromFacility < ActiveRecord::Migration
  def change
    remove_column :facilities, :name
  end
end
