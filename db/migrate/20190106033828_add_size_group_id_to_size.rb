class AddSizeGroupIdToSize < ActiveRecord::Migration[5.0]
  def change
    add_reference :sizes, :size_group, foreign_key: true
  end
end
