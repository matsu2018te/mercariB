class AddCardNumberToCredits < ActiveRecord::Migration[5.0]
  def change
    add_column :credits, :card_number, :string
  end
end
