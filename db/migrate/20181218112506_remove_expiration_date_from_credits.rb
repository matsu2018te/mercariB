class RemoveExpirationDateFromCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :expiration_date_month, :integer
    remove_column :credits, :expiration_date_year, :integer
  end
end
