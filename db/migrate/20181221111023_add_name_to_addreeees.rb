class AddNameToAddreeees < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :first_name, :string, null: false, after: :id
    add_column :addresses, :last_name, :string, null: false, after: :id
    add_column :addresses, :first_name_phonetic, :string, null: false, after: :id
    add_column :addresses, :last_name_phonetic, :string, null: false, after: :id
  end
end
