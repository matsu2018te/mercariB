class ChangeDatatypeprefectureOfAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :prefecture, :integer
  end
end
