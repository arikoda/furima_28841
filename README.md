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

|    Column     |    Type    |   Options   |
| ------------- | -----------| ------------|
| family_name   |   string   | null: false |
| first_name    |   string   | null: false |
| family_n_ruby |   string   | null: false |
| first_n_ruby  |   string   | mill: false | 
| nickname      |   string   | null: false |
| email         |   string   | null: false |
| password      |   string   | null: false |
| birthday      |   date     | null: false |


### Association
- has_many :items
- has_many :orders
- has_many :addresses
- has_many :comments
- has_many :favorite_items


## itemsテーブル

|  Column      |    Type    |   Options   |
| ------------ | -----------| ----------- |
|  name        |  string    | null: false | 
|  explanation |  text      | null: false |
|  image       |  text      | null: false |
|  price       |  integer   | null: false |
|  category    |  integer   | null: false |
|  condition   |  integer   | null: false |
|  postage     |  integer   | null: false |
|  send_day    |  integer   | null: false |
|  user        | references | null: false |

### Association
- has_one  :order
- has_many :comments
- has_one  :address
- belongs_to :user
- has_many :favorite_items

## ordersテーブル

|   Column   |    Type    |   Options   |
| ---------- | -----------| ----------- |
|   item     | references | null: false |
|   user     | references | null: false |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## commentsテーブル

|  Column  |    Type    |   Options   |
| -------- | -----------| ----------- |
|  text    | text       | null: false |
|  user    | references | null: false |
|  item    | references | null: false |

### Association
- belongs_to :item
- belongs_to :user

## addressテーブル

|    Column      |    Type     |   Options   |
| -------------- | ------------| ----------- |
| postal_code    |  string     | null: false |
| prefecture     |  integer    | null: false | 
| municipality   |  string     | null: false | 
| home_number    |  integer    | null: false |
| building_number|  integer    |             |
| user           |  references | null: false |
| telephone      |  string     | null:false  |

### Association
- belongs_to: order

## favorite_itemsテーブル

|    Column   |    Type    |   Options                     |
| ----------- | -----------| ----------------------------- |
|   item      | references | null: false, foreign_key: true|
|   user      | references | null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: item