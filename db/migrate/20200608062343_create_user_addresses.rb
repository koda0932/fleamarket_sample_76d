class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :postcode    
      t.string :prefecture   
      t.string :city         
      t.string :address      
      t.string :apartment_first_name
      t.string :apartment_first_name_kana
      t.string :apartment_family_name
      t.string :apartment_family_name_kana
      t.string :apartment  
      t.string :telephone    
      t.bigint :user_id, null: false
      t.timestamps
    end
  end
end
