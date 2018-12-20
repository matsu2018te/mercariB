class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false
      t.string :belongs
      t.string :ancestry, index: true
      t.timestamps
    end
  end
end
