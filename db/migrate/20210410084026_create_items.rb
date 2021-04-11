class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :item_name
      t.text :info
      t.string :category
      t.string :sales_status
      t.string :shipping_fee_status
      t.string :prefecture
      t.string :scheduled_delivery
      t.integer :price
      t.timestamps
    end
  end
end
