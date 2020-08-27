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

## usersテーブル

|  Column  |    Type    |   Options   |
| -------- | -----------| ------------|
| nickname |   string   | null: false |
| email    |   string   | null: false |
| password |   string   | null: false |
| address  |   string   | null: false |
| telephone|   integer  | null: false |

### Association
- has_many :items
- has_many :orders
- has_many :shopping_address
- has_many :comments
- has_many :favorite_items


## itemsテーブル

|  Column  |    Type    |   Options   |
| -------- | -----------| ----------- |
|   text   |    text    | null: false |
|  image   |    text    | null: false |
|  price   |   integer  | null: false |
|  category|   string   | null: false |
|  use_id  | references | null: false |

### Association
- has_one :orders
- has_many :comments
- has_one :shopping_address
- belongs_to :users
- has_many :favorite_items

## ordersテーブル

|   Column   |    Type    |   Options   |
| ---------- | -----------| ----------- |
| card_number| integer    |             |
|   term     | date       |             |
|  seq_num   | integer    |             |
|   item_id  | references | null: false |
|   user_id  | references | null: false |

### Association
- belongs_to :items
- belongs_to :users
- has_one :shopping_address


## commentsテーブル

|  Column  |    Type    |   Options   |
| -------- | -----------| ----------- |
|   text   |     text   | null: false |
|  user_id | references | null: false |
|  item_id | references | null: false |

### Association
- belongs_to :items
- belongs_to :users

## shopping_addressテーブル

|    Column   |    Type    |   Options   |
| ----------- | -----------| ----------- |
| postal_code |   integer  | null: false |
|   address   |   string   | null: false |
|   user_id   | references | null: false |
|  telephone  |  integer   | null:false  |

### Association
- belongs_to: orders
- belongs_to: users
- belongs_to: items

## favorite_itemsテーブル

|    Column   |    Type    |   Options                     |
| ----------- | -----------| ----------------------------- |
|   item_id   | references | null: false, foreign_key: true|
|   user_id   | references | null: false, foreign_key: true|

### Association
- belongs_to: users
- belongs_to: items