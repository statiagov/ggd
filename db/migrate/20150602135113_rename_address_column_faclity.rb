class RenameAddressColumnFaclity < ActiveRecord::Migration
  def change
    rename_column :facilities, :address, :location
  end
end
