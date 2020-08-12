class CreatePostBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :post_brands do |t|
      t.text :name
      t.references :post ,foreign_key: true
      t.timestamps
    end
  end
end
