class RemoveCategoryIdIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :category_id_id, :integer
  end
end
