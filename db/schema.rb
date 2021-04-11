# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_10_084154) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "item_name"
    t.text "info"
    t.string "category"
    t.string "sales_status"
    t.string "shipping_fee_status"
    t.string "prefecture"
    t.string "scheduled_delivery"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "card_number"
    t.integer "card_exp_month"
    t.integer "card_exp_year"
    t.integer "card_cvc"
    t.integer "postal_code"
    t.string "prefecture"
    t.string "city"
    t.string "sddresses"
    t.string "building"
    t.integer "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "password"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.integer "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
