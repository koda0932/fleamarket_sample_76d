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

# fleamarket_sample_76d DB設計

## post_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|references|null: false, foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :post

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :posts

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|
### Association
- has_many :posts
- has_many :comments
- has_many :likes
- has_one :user_address
- has_one :card 

## user_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer(7)|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null:false|
|apartment|string||
|telephone|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post, counter_cache: :likes_count

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduce|text|null: false|
|category_id|references|null: false, foreign_key: true|
|delivery_fee|integer|null: false|
|user_address|integer|null: false|
|shipping|integer|null: false|
|price|integer|null: false|
|status|integer|null: false|
|delivery_status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|purchased|boolean|default: false, null: false|
### Association
- belongs_to :category
- belongs_to :user
- has_many :post_images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_id|string|null: false|
|customor_id|string|null: false|
### Association
- belongs_to :user