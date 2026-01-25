# README

# データベース設計

## ER図(URL)
https://gyazo.com/46040c52dfdb1f0409ec654bdf552e1c


# users テーブル

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| id                 | bigint   | primary key               |
| username           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |
| created_at         | datetime | null: false               |
| updated_at         | datetime | null: false               |

# Association
- has_many :items
- has_many :orders

---

# items テーブル

| Column           | Type     | Options                        |
|------------------|----------|--------------------------------|
| id               | bigint   | primary key                    |
| name             | string   | null: false                    |
| description      | text     | null: false                    |
| price            | integer  | null: false                    |
| category_id      | integer  | null: false                    |
| condition_id     | integer  | null: false                    |
| shipping_fee_id  | integer  | null: false                    |
| prefecture_id    | integer  | null: false                    |
| shipping_day_id  | integer  | null: false                    |
| user             |references| null: false, foreign_key: true |
| created_at       | datetime | null: false                    |
| updated_at       | datetime | null: false                    |

# Association
- belongs_to :user
- has_one :order

---

# orders テーブル

| Column     | Type     | Options                        |
|------------|----------|--------------------------------|
| id         | bigint   | primary key                    |
| user       |references| null: false, foreign_key: true |
| item       |references| null: false, foreign_key: true |
| created_at | datetime | null: false                    |
| updated_at | datetime | null: false                    |

# Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル（配達先情報）

| Column          | Type     | Options                        | 
|-----------------|----------|--------------------------------|
| id              | bigint   | null: false, primary key       | 
| postal_code     | string   | null: false                    | 
| prefecture_id   | integer  | null: false                    |
| city            | string   | null: false                    |
| address_line    | string   | null: false                    | 
| building        | string   |                                | 
| phone_number    | string   | null: false                    | 
| order           |references| null: false, foreign_key: true | 
| created_at      | datetime | null: false                    | 
| updated_at      | datetime | null: false                    | 

### アソシエーション
- belongs_to :order  
