class RemoveFistNamePhoneticFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :fist_name_phonetic, :string
  end
end
