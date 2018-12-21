class RenameCategoryNameToCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :category_name, :name
  end
end
