# テーブル設計

## users テーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| nickname                  | string     | null: false                    |
| email                 | string     | null: false                    |
| password              | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birth_date            | integer    | null: false                    |

### Association

- has_many :items
- has_one :orders

## items テーブル
| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| item_name                | text       | null: false                    |
| info                | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| price               | integer    | null: false                    |

### Association

- has_one :orders
- belongs_to :users

## orders テーブル

| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| card_number              | integer    | null: false                    |
| card_exp-month           | integer    | null: false                    |
| card_exp-year            | integer    | null: false                    |
| card_cvc                 | integer    | null: false                    |
| postal_code              | integer    | null: false                    |
| prefecture               | string     | null: false                    |
| city                     | string     | null: false                    |
| addresses                | string     | null: false                    |
| building                 | string     | null: false                    |
| phone_number             | integer    | null: false                    |

### Association

- belongs_to :users
- belongs to :items