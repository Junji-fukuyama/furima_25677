# DB設計



## usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|nick_name|string|null: false|
|email|string|null: false|
|password|string|null, false|
|reset_password|string|null: false|
|first_name|string|null: false|
|first_name_reading|string|null: false|
|last_name|string|null: false|
|last_name_reading|string|null: false|
|birthday|date|null: false|

### Association
- has_one :addresses
- has_many: items, foreign_key: user_id



## itemsテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false, index: true|
|detail|text|null: false|
|category|references|null: false, foreign_key: true|
|condition|integer|null: false|
|delivery_fee_payer|integer|null: false|
|prefecture_id|references|foreign_key: true|
|delivery_days|integer|null: false|
|prise|integer|null: false|
|seller|references|null: false, foreign_key: to_tables: :users|
|buyer|references|null: false, foreign_key: to_tables: :users|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :prefecture



## prefecturesテーブル
### Association
- has_many :items
- has_one :buy



## buyテーブル
|Colum|Type|Options|
|-----|----|-------|
|card_number|integer|null: false|
|expiration_date|date|null: false|
|security_code|integer|null: false|
|postal_code|string|null :false|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|integer|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- belongs_to_active_hash :prefecture



## categoriesテーブル
|Colum|Type|Options|
|-----|----|-------|
|title|string|null: false|
|text|text|null: false|
|category_id|integer|null: false|

### Association
- has_many :items