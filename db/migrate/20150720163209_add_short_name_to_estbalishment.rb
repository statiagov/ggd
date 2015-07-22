class AddShortNameToEstbalishment < ActiveRecord::Migration
  def change
    add_column :establishments, :short_name, :string
    add_index :establishments,:short_name, unique: true
  end
end
