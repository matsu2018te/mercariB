class RenameColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :product_name, :name
    rename_column :products, :product_info, :info
    rename_column :products, :product_state, :status
  end
end
