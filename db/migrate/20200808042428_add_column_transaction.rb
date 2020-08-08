class AddColumnTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :review, :integer
  end
end
