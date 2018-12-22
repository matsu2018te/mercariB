class RemoveNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name, :string, null: false
    remove_column :users, :last_name, :string, null: false
    remove_column :users, :fist_name_phonetic, :string, null: false
    remove_column :users, :last_name_phonetic, :string, null: false
  end
end
