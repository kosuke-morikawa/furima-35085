# テーブル設計

## users テーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| nickname               | string     | null: false                    |
| email                 | string     | unique: true                    |
| password              | string     | null: false                    |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birth_date            | date       | null: false                    |

### Association

- has_many :product
- belongs_to :order

## product テーブル
| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| name                     | integer    | null: false                    |
| info                     | text       | null: false                    |
| category_id              | integer    | null: false                    |
| sales_status_id          | integer    | null: false                    |
| shipping_fee_status_id   | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| scheduled_delivery_id    | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user_id                  | integer    |null: false

### Association

- belongs_to :user
- belongs_to :orser
- belongs_to :card
- belongs_to :destination

## destination テーブル

| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| postal_code              | integer    | null: false                    |
| prefecture               | string     | null: false                    |
| city                     | string     | null: false                    |
| addresses                | string     | null: false                    |
| building                 | string     |                                |
| phone_number             | string     | null: false                    |

### Association

- has_one :product

## card テーブル
| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| number              | integer    | null: false                    |
| exp-month           | integer    | null: false                    |
| exp-year            | integer    | null: false                    |
| cvc                 | integer    | null: false                    |

### Association

- has_one :product

## orders テーブル

| Column                   | Type       | Options                        |
| ------                   | ---------- | ------------------------------ |
| user                     | string     | null: false                    |
| product_id               | string     | null: false                    |

- has_one :product
- has_one :user