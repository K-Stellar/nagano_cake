class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false
      t.integer :makig_status, null: false, default: 0
      t.integer :price, null: false

      t.timestamps
    end
  end
end
