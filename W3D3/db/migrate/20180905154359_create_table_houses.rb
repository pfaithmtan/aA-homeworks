class CreateTableHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :table_houses do |t|
      t.string :address, null: false
      t.timestamps
    end
  end
end
