class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end