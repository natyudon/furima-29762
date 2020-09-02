# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :comments
- has_many :products
- has_many :shipping_addresses

## products テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| product_name | string | null: false |
| content      | text   | null: false |
| category     | string | null: false |
| state        | string | null: false |
| delivery_fee | string | null: false |
| area         | string | null: false |
| delivery_day | string | null: false |
| price        | integer| null: false |
| user_id      | integer| null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :shipping_address
 
## comments テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| text         | text   | null: false |
| user_id      | integer| null: false |
| product_id   | integer| null: false |

### Association

- belongs_to :user
- belongs_to :product

## shipping_addresses テーブル

| Column          | Type   | Options     |
| ------------    | ------ | ----------- |
| postal_code     | string | null: false |
| prefecture      | string | null: false |
| municipalitie   | stinrg | null: false |
| address         | string | null: false |
| building        | string |             |
| phone_number    | integer| null: false |
| product_id      | integer| null: false |
| purchase_user_id| integer| null: false |

### Association

- belongs_to :user
- belongs_to :product