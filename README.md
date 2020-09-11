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
| last_name| string | null: false |
| first_name| string | null: false |
| last_name_kana| string | null: false |
| first_name_kana| string | null: false |
| birth_date| date | null: false |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user         | references| null: false, foreign_key: true |
| name         | string | null: false |
| content      | text   | null: false |
| price        | integer| null: false |
| category_id  | integer| null: false |
| state_id     | integer| null: false |
| delivery_fee_id | integer| null: false |
| area_id      | integer| null: false |
| delivery_day_id | integer| null: false |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type   | Options     |
| ------------    | ------ | ----------- |
| user            | references| null: false, foreign_key: true |
| product         | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column          | Type   | Options     |
| ------------    | ------ | ----------- |
| postal_code     | string | null: false |
| prefecture_id   | integer| null: false |
| municipalitie   | stinrg | null: false |
| address         | string | null: false |
| building        | string |             |
| phone_number    | string | null: false |
| order           | references| null: false, foreign_key: true |

### Association

- belongs_to :order