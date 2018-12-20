class AddDefaultToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :telephone, nil
    change_column_default :users, :birth_year, nil
    change_column_default :users, :birth_month, nil
    change_column_default :users, :birth_day, nil
  end
end
