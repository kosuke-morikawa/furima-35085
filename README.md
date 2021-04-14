# テーブル設計

## users テーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| nickname               | string     | null: false                    |
| email                 | string     | unique: true                    |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birth_date            | date       | null: false                    |

### Association

- has_many :products
- has_many :orders

## product テーブル
| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| info                     | text       | null: false                    |
| category_id              | integer    | null: false                    |
| sales_status_id          | integer    | null: false                    |
| shipping_fee_status_id   | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| scheduled_delivery_id    | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## destination テーブル

| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| postal_code              | string     | null: false                    |
| prefecture_id            | integer    | null: false                    |
| city                     | string     | null: false                    |
| addresses                | string     | null: false                    |
| building                 | string     |                                |
| phone_number             | string     | null: false                    |
| product                  | references | null: false, foreign_key: true |
| order                    | references | null: false, foreign_key: true |

### Association

has_one :order


## orders テーブル

| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| user                     | references | null: false, foreign_key: true |
| product                  | references | null: false, foreign_key: true |
| destination              | references | null: false, foreign_key: true |

- belongs to :product
- belongs_to :user
- belongs_to :destination