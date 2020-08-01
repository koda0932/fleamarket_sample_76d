class CreateTransactionMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_messages do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
