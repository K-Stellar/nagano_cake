class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_cost, null: false
      t.integer :total_payment, null: false
      t.integer :payment_type, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
