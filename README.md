# テーブル設計

## usersテーブル（ユーザー）

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| nickname                | string  | null: false |
| email                   | string  | null: false |
| encrypted_password      | string  | null: false |
| name_chinese_characters | string  | null: false |
| name_katakana           | string  | null: false |
| birthday                | integer | null: false |

### Association
- has_many :item_listings
- has_many :item_purchases


## item_listingsテーブル（商品出品）

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_explanation | text       | null: false       |
| category_id         | integer    | null: false       |
| product_status_id   | integer    | null: false       |
| shipping_charges_id | integer    | null: false       |
| prefectures         | integer    | null: false       |
| days_to_ship_id     | integer    | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association
- belongs_to :user
- has_one    :item_purchase


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
- belongs_to :user
- belongs_to :item_listing
- has_one    :shipping_address


## shipping_addressテーブル（配送先住所）

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures    | string     | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| item_purchases | references | foreign_key: true |

### Association
- belongs_to :item_purchase