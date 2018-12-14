class AddUserInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :fist_name_phonetic, :string, null: false
    add_column :users, :last_name_phonetic, :string, null: false
    add_column :users, :telephone, :integer, null: false, unique: true
    add_column :users, :birthday, :datetime, null: false
    add_column :users, :icon_picture, :string
    add_column :users, :profile, :text
    add_column :users, :background_image, :string
    add_column :users, :point, :integer
  end
end
