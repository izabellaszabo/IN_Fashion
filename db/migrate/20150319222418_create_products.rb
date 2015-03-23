class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :Title
      t.string :Description
      t.string :Catagory
      t.decimal :price, precision: 12, scale: 3
      t.string :Size
      t.string :Colour
      t.references :Review, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :Reviews
  end
end
