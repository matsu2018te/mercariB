class AddColumnToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :image2, :string, after: :image
    add_column :images, :image3, :string, after: :image2
    add_column :images, :image4, :string, after: :image3
  end
end
