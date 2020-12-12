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
|encrypted_password|string|null:false|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_day|date|null:false|

### Association
- has_many :items, dependent: :destroy
- has_many :item_purchases, dependent: :destroy

## items
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|introduction|text|null:false|
|category_id|integer|null:false|
|status_id|integer|null:false|
|shipping_charges_id|integer|null:false|
|shipping_date_id|integer|null:false|
|price|string|integer|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_one :item_purchase
- belongs_to_active_hash :prefectures(active_hash)
- belongs_to_active_hash :category(active_hash)
- belongs_to_active_hash :status(active_hash)
- belongs_to_active_hash :shipping_charges(active_hash)


## item_purchases
|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :items
- has_one :sending_destination


## sending_destinations
|Column|Type|Options|
|------|----|-------|
|post_code|string|null:false|
|prefecture_id|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name|string||
|phone_number|string|null:false|
|user|references|foreign_key: true|

### Association
- has_one_active_hash :prefectures(active_hash)
- belongs_to :item_purchase


