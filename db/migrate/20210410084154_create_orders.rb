class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :card_number
      t.integer :card_exp_month
      t.integer :card_exp_year
      t.integer :card_cvc
      t.integer :postal_code
      t.string :prefecture
      t.string :city
      t.string :sddresses
      t.string :building
      t.integer :phone_number
      t.timestamps
    end
  end
end
