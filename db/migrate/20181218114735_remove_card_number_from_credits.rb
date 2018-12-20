class RemoveCardNumberFromCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :card_number, :integer
  end
end
