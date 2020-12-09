# テーブル設計

## usersテーブル（ユーザー）

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :item_listings
- has_many :item_purchases


## item_listingsテーブル（商品出品）

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_explanation | text       | null: false       |
| category            | string     | null: false       |
| product_status      | string     | null: false       |
| shipping_charges    | integer    | null: false       |
| shipping_area       | string     | null: false       |
| days_to_ship        | string     | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |
| item_purchase       | references | foreign_key: true |

### Association
- belongs_to :users
- has_one    :item_purchases


## item_purchasesテーブル（商品購入）

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| card_information | integer    | null: false       |
| expiration_date  | integer    | null: false       |
| security_code    | integer    | null: false       |
| user             | references | foreign_key: true |
| item_listings    | references | foreign_key: true |
| shipping_address | references | foreign_key: true |

### Association
- belongs_to :users
- belongs_to :item_listings
- has_one    :shipping_address


## shipping_addressテーブル（配送先住所）

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | integer    | null: false       |
| prefectures    | string     | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | integer    | null: false       |
| item_purchases | references | foreign_key: true |

### Association
- belongs_to :item_purchases