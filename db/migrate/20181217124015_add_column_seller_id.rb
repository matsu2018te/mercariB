class AddColumnSellerId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :seller_id, :integer
    add_column :users, :buyer_id, :integer
  end
end
