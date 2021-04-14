class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :info
      t.integer :category_id
      t.integer :sales_status_id
      t.integer :shipping_fee_status_id
      t.integer :prefecture_id
      t.integer :scheduled_delivery_id
      t.string :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
