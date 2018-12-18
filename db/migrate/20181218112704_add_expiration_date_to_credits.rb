class AddExpirationDateToCredits < ActiveRecord::Migration[5.0]
  def change
    add_column :credits, :expiration_month, :integer, null: false
    add_column :credits, :expiration_year, :integer, null: false
  end
end
