class CreateTablePersons < ActiveRecord::Migration[5.2]
  def change
    create_table :table_persons do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
