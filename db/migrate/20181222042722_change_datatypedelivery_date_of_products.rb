class ChangeDatatypedeliveryDateOfProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :delivery_date, :string
  end
end
