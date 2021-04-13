class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name
      t.text :info
      t.string :category
      t.string :sales_status
      t.string :shipping_fee_status
      t.string :prefecture
      t.string :scheduled_delivery
      t.integer :price
      t.string :user_id,  foreign_key: true
      t.timestamps
    end
  end
end
