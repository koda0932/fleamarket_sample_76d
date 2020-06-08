class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.integer :postcode    
      t.string :prefecture   
      t.string :city         
      t.string :address      
      t.string :apartment  
      t.string :telephone    
      t.integer :user_id

      t.timestamps
    end
  end
end