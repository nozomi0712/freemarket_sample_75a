## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, minimum7|
|birthday|date|null: false|
|first_name|string|null: false|
|first_furigana|string|null: false|
|last_name|string|null: false|
|last_furigana|string|null: false|

### Association
has_many :item
has_many :card
has_many :user_address


## itemテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|explanation|string|null: false|
|price|integer|null: false|
|bland|string|
|condition|string|null: false|
|user_id|references.true|null: false|
|ship_date|string|null: false|
|delivery_fee|integer|null: false|

### Association
belongs_to :user
has_many :category
has_many :image


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
|item_id|references.true|null: false|

### Association
belongs_to :item


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|image|string|null: false|

### Association
belongs_to :item


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references.true|null: false|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association
belongs_to :user


## user_addressテーブル
|Column|Type|Options|
|------|----|-------|
|post|integer|null: false|
|preficture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|
|tell_number|integer|
|user_id|references.true|null: false|

### Association
belongs_to :user
