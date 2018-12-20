class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :category, foreign_key: true
    add_reference :products, :brand, foreign_key: true
    add_reference :products, :sell_status, foreign_key: true
  end
end
