# DB設計



## usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|email|string|null: false, default: ""|
|encrypted_password|string|null, false, default: ""|

### Association
-has_one :cards, dependent: :destroy
-has_one :addresses, dependent: :destroy
-has_many: items, foreign_key: user_id



## cardsテーブル
|Colum|Type|Options|
|-----|----|-------|
|card_token|string|null: false|
|customer_token|string|null: false|
|user|references|foreign_key: true|

### Association
-belongs_to :user, optional: true



## itemsテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false, index: true|
|prise|integer|null: false|
|detail|text|null: false|
|condition|integer|null: false|
|delivery_fee_payer|integer|null: false|
|delivery_method|integer|null: false|
|delivery_agency|integer|null: false|
|delivery_days|integer|null: false|
|deal|integer|null: false|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :category
-has_many :item_images, dependent: :destroy
-belongs_to_active_hash :prefecture



## item_imagesテーブル
|Colum|Type|Options|
|-----|----|-------|
|image|text|null: false|
|item|references|foreign_key: true|

### Association
-belongs_to :item, optional: true



## prefecturesテーブル
### Association
-has_many :items
-has_one :address



## addressesテーブル
|Colum|Type|Options|
|-----|----|-------|
|phone_number|string||
|postal_code|string|default: ""|
|prefecture_id|integer|
|city|string|default, ""|
|house_number|string|default, ""|
|building_name|string|default, ""|
|user|references|foreign_key: true|

### Association
-belongs_to :user, optional: true
-belongs_to_active_hash :prefecture


## categoriesテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|ancesty|string||

### Association
-has_many :items
-has_ancesty