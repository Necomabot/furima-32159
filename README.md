# テーブル設計

## usersテーブル（ユーザー）

| Column                        | Type    | Options       |
| ----------------------------- | ------- | ------------- |
| nickname                      | string  | null:   false |
| email                         | string  | unique: true  |
| encrypted_password            | string  | null:   false |
| last_name_chinese_characters  | string  | null:   false |
| first_name_chinese_characters | string  | null:   false |
| last_name_katakana            | string  | null:   false |
| first_name_katakana           | string  | null:   false |
| birthday                      | date    | null:   false |

### Association
- has_many :items
- has_many :item_purchases


## itemsテーブル（商品出品）

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| explanation            | text       | null: false       |
| category_id            | integer    | null: false       |
| status_id              | integer    | null: false       |
| shipping_fee_burden_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| days_to_ship_id        | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association
- belongs_to :user
- has_one    :item_purchase


## item_purchasesテーブル（商品購入）

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_addressテーブル（配送先住所）

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| item_purchase  | references | foreign_key: true |

### Association
- belongs_to :item_purchase