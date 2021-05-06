# DB設計


## usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birth_date|date|null: false|

### Association
- has_many: items
- has_many: orders



## itemsテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|info|text|null: false|
|category_id(active_hash)|integer|null: false|
|condition_id(active_hash)|integer|null: false|
|shipping_fee_status_id(active_hash)|integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|scheduled_delivery_id(active_hash)|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order



## ordersテーブル
|Colum|Type|Options|
|-----|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address



## addressesテーブル
|Colum|Type|Options|
|-----|----|-------|
|postal_code|string|null :false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|string|null: false|
|order|references|null: false, foreign_key: true|

### Association
- belongs_to :order