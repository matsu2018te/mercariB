class AddFirstNamePhoneticToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name_phonetic, :string
  end
end
