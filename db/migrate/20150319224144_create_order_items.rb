class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :Product, index: true
      t.integer :Quantity
      t.decimal :Total_Price, precision: 12, scale: 3

      t.timestamps null: false
    end
    add_foreign_key :order_items, :Products
  end
end
