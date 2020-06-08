class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.integer :postcode    
      t.string :prefecture   
      t.string :city         
      t.string :address      
      t.string :apartment  
      t.string :telephone    
      t.references :user, foreign_key: true

    t.timestamps
    end
  end
end