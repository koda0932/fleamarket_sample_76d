class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :buyer ,foreign_key: { to_table: :users }
      t.references :seller ,foreign_key: { to_table: :users }
      t.references :post ,foreign_key: true
      t.timestamps
    end
  end
end