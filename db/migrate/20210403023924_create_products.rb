class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string     :name                   null: false
      t.string     :info                   null: false
      t.integer    :category_id            null: false
      t.integer    :sales_status_id        null: false
      t.integer    :shipping_fee_status_id null: false
      t.integer    :prefecture_id          null: false
      t.integer    :scheduled_delivery_id  null: false
      t.string     :price                  null: false
      t.references :user,                  null: false,foreign_key: true

      t.timestamps
    end
  end
end
