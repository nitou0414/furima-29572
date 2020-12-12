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

## users
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|unique: true|
|ncrypted_password|string|null:false|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_day|date|null:false|

### Association
- has_many :items, dependent: :destroy
- has_many :item_purchase, dependent: :destroy

## items
|Column|Type|Options|
|------|----|-------|
|photo|text|null: false|
|name|string|null:false|
|introduction|text|null:false|
|category|integer|null:false|
|status|integer|null:false|
|shipping_charges|integer|null:false|
|shipping_area|integer|null:false|
|shipping_date|integer|null:false|
|price|string|integer|
|user|references|integer|

### Association
- belongs_to :user
- has_one :item_purchase
- belongs_to_active_hash :prefectures(active_hash)
- belongs_to_active_hash :category(active_hash)
- belongs_to_active_hash :status(active_hash)
- belongs_to_active_hash :shipping_charges(active_hash)
- belongs_to_active_hash :shipping_area(active_hash)


## item_purchase
|Column|Type|Options|
|------|----|-------|
|product|integer|null: false, foreign_key: true|
|user|integer|null: false, foreign_key: true|
|purchase_info|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :items
- belongs_to :sending_destinations


## sending_destinations
|Column|Type|Options|
|------|----|-------|
|post_code|string|null:false|
|prefectures_id|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name|string||
|phone_number|string|null:false|

### Association
- has_one_active_hash :prefectures(active_hash)
- has_one :item_purchase


