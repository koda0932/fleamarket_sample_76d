class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode    
      t.string :prefecture   
      t.string :city         
      t.string :address      
      t.string :apartment
      t.string :telephone    
      t.references :user

    t.timestamps
    end
  end
end