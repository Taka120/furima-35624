# README

## usersテーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_name_reading | string   | null: false |
| last_name_reading  | string   | null: false |
| birthday           | datetime | null: false |

### Association
has_many :items

## itemsテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| item_name    | text    | null: false |
| explanation  | text    | null: false |
| category     | integer | null: false |
| status       | integer | null: false |
| delivery_fee | integer | null: false |
| area         | integer | null: false |
| days_to_ship | integer | null: false |
| item_price   | integer | null: false |

### Association
belongs_to :users
has_one :purchases
has_one :addresses

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :purchases
has_one :addresses

## addressesテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_number    | integer | null: false |
| prefectures      | integer | null: false |
| municipalities   | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| telephone_number | integer | null: false |

### Association
belongs_to :items
belongs_to :purchases