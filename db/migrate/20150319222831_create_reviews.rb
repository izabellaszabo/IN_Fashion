class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :Product, index: true
      t.string :Comment
      t.string :Rating
      t.datetime :Date

      t.timestamps null: false
    end
    add_foreign_key :reviews, :Products
  end
end
