class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_id, foreign_key: true
      t.string :product_id, foreign_key: true
      t.timestamps
    end
  end
end
