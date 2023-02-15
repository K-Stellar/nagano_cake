class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :information, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
