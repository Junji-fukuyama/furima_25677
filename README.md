# DB設計



## usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|encrypted_password|string|null, false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birth_date|date|null: false|

### Association
- has_many: items
- has_many: items_transactions


## addressesテーブル
|Colum|Type|Options|
|-----|----|-------|
|postal_code|integer|null :false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|string|null: false|
|item_transaction_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item_transaction



## itemsテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|prise|integer|null: false|
|info|text|null: false|
|scheduled_delivery_id(active_hash)|integer|null: false|
|shipping_fee_status_id(active_hash)|integer|null: false|
|category_id(active_hash)|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :item_transaction



## item_transactionsテーブル
|Colum|Type|Options|
|-----|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address