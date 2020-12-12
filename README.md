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
|name|string|null: false|
|email|string|null:false|
|password|string|null:false|

Association
has_many :items, dependent: :destroy
has_many :comments, dependent: :destroy
has_one :profiles, dependent: :destroy
has_one :cards, dependent: :destroy
has_one :sending_destinations, dependent: :destroy

## profiles
|Column|Type|Options|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name kana|string|null:false|
|family_name kana|string|null:false|
|birth_day|date|null:false|
|user_id|references|foreign_key: true|

Association
belongs_to :user

## cards
|Column|Type|Options|
|user_id|references|foreign_key: true|
|card_number|string|null:false|
|expiration|string|null:false|
|code_number|string|null:false|

Association
belongs_to :user

## sending_destinations
|Column|Type|Options|
|user_id|references|foreign_key: true|
|post_code|string|null:false|
|prefectures|string|null:false|
|municipality|string|null:false|
|address|string|null:false|
|building name|string|null:false|
|phone_number|string|null:false|

Association
belongs_to: user

## comments
|Column|Type|Options|
|comment|text|null:false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

Association
belongs_to :user
belongs_to :item

## items
|Column|Type|Options|
|name|string|null:false|
|introduction|text|null:false|
|categories|string|null:false|
|status|string|null:false|
|shipping charges|string|null:false|
|shipping area|string|null:false|
|shipping date|string|null:false|
|price|string|null:false|

Association
has_many :comments, dependent: :destroy
has_many :item_imgs, dependent: :destroy
belongs_to :user

## item_imgs
|Column|Type|Options|
|img|string|null:false|
|item_id|references|foreign_key: true|

Association
belongs_to :item