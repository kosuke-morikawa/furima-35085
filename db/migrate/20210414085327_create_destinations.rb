class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :city
      t.string :addresses
      t.string :building
      t.string :phone_number
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
