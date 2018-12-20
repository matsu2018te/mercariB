class CreateSellStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :sell_statuses do |t|
      t.integer :status, null: false
      t.timestamps
    end
  end
end
