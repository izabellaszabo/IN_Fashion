class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :message
      t.boolean :readmsg
      t.boolean :replied

      t.timestamps null: false
    end
  end
end
