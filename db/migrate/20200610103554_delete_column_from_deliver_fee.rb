class DeleteColumnFromDeliverFee < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :delivery_fee, :integer
  end
end
