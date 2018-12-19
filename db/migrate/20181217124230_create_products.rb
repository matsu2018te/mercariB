class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :seller
      t.references :buyer
      t.string     :product_name, null: false
      t.text       :product_info, null: false
      t.integer    :price, null: false
      t.string     :product_state, null: false
      t.string     :delivery_fee_owner, null: false
      t.datetime   :delivery_date, null: false
      t.string     :shipping_method, null: false
      t.timestamps
    end
    add_foreign_key :products, :users, column: :seller_id
    add_foreign_key :products, :users, column: :buyer_id
  end
end
