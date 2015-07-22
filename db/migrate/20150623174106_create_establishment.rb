class CreateEstablishment < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name, length:100

      t.timestamps null: false
    end
  end
end
