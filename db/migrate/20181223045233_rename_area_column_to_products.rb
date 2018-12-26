class RenameAreaColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :area, :prefecture
  end
end
