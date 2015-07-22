class AddEstablishmentIdToFacility < ActiveRecord::Migration
  def change
    add_column :facilities, :establishment_id, :integer
    add_index  :facilities, :establishment_id
  end
end
