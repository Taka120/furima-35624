# README

## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_reading | string   | null: false               |
| last_name_reading  | string   | null: false               |
| birthday           | datetime | null: false               |

### Association
has_many :items

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| days_to_ship_id | integer    | null: false                    |
| item_price      | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase
has_one :address

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
has_one :address
belongs_to :item

## addressesテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_number    | string      | null: false                    |
| prefectures      | integer     | null: false                    |
| municipalities   | string      | null: false                    |
| address          | string      | null: false                    |
| building_name    | string      |                                |
| telephone_number | string      | null: false                    |
| purchase_id      | references  | null: false, foreign_key: true |

### Association
belongs_to :purchase