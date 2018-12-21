class RenameFistNamePhoneticColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :fist_name_phonetic, :first_name_phonetic
  end
end
