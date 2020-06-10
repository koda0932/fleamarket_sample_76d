class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :introduce, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :delivery_fee, null: false
      t.integer :user_address, null: false
      t.integer :shipping, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :delivery_status, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :purchased, default: false, null: false
      t.timestamps
    end
  end
end
