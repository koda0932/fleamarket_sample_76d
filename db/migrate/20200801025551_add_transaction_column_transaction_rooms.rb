class AddTransactionColumnTransactionRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :transaction_room, foreign_key: true
  end
end
