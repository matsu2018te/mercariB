class CreatePriceRecommends < ActiveRecord::Migration[5.0]
  def change
    create_table :price_recommends do |t|

      t.timestamps
    end
  end
end
