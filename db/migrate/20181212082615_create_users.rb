class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :fist_name_phonetic, null: false
      t.string :last_name_phonetic, null: false
      t.integer :telephone, null: false, unique: true
      t.string :email, null: false
      t.string :password, null: false
      t.datetime :birthday, null: false
      t.string :icon_picture
      t.text :profile
      t.string :background_image
      t.integer :point
      t.timestamps
    end
  end
end
