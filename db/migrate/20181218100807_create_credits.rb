class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer :card_number, null: false, unique: true
      t.integer :expiration_date_month, null: false
      t.integer :expiration_date_year, null: false
      t.integer :security_code, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
