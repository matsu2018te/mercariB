class AddAreaToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :area, :integer, null: false
  end
end
