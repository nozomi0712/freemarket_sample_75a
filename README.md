## usersテーブル
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
has_many :items
has_many :cards
has_many :user_address


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|explanation|string|null: false|
|price|integer|null: false|
|brand|string|
|condition|string|null: false|
|status|string|null: false|
|ship_date|string|null: false|
|delivery_fee|integer|null: false|
|items status|string|null: false|
|user_id|references.true|null: false|
|category_id|references.true|null: false|
### Association
belongs_to :user
belongs_to :category
has_many :images


## tradeテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references.true|null: false|
|seler_id|references.true|null: false|
|buyer_id|references.true|null: false|
### Association
belongs_to :user
belongs_to :items


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false ancestry:string:index|
|ancestry|string|null: false|
### Association
has_many :items


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|image|string|null: false|
### Association
belongs_to :item


## cardsテーブル
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