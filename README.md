# README
# mercariB

## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|telephone|integer|null: false, unique: true|
|email|string|null: false|
|password|string|null: false|
|birth_year|integer||
|birth_month|integer||
|birth_day|integer||
|icon_picture|string||
|profile|text||
|background_image|string||
|point|integer||


### Association
- has_many :buyer_products, class_name: 'Product', :foreign_key => 'buyer_id'
- has_many :seller_products, class_name: 'Product', :foreign_key => 'seller_id'
- has_many :user_evalutions
- has_many :evalutions, through: :user_evalutions
- has_one :credit
- has_one  :address
- has_many :sns_credentials


## user_evalution

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key|
|evaluation_id|references|foreign_key|

### Association
- has_many :user
- has_many :evaluation


## evalution
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|

### Association
- has_many :user_evalutions
- has_many :users, through: :user_evalutions


## sns_credential
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|
|provider|string|null: false|
|user_id|references|foreign_key|

### Association
- belongs_to :user


## credit
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false, unique: true|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|foreign_key|

### Association
- belongs_to :user


## address
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|municipality|string|null: false|
|address_number|string|null: false|
|building_name|string||
|first_name|string|null: false|
|last_name|string|null: false|
|fist_name_phonetic|string|null: false|
|last_name_phonetic|string|null: false|
|user_id|references|foreign_key|

### Association
- belongs_to :user


## comment
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key|
|text|text|null: false|
|product_id|references|foreign_key|

### Association
- belongs_to :user
- belongs_to :product


## product
|Column|Type|Options|
|------|----|-------|
|seller_id|references|foreign_key, class_name: "User"|
|buyer_id|references|foreign_key, class_name: "User"|
|name|string|null: false|
|info|text|null: false|
|price|integer|null: false|
|category_id|references|foreign_key|
|brand_id|references|foreign_key|
|size_id|references|foreign_key|
|status|string|null: false|
|delivery_fee_owner|string|null: false|
|precfecture|integer|null: false|
|delivery_date|string|null: false|
|sell_status_id|references|foreign_key|
|shipping_method|string|null: false|
|image_id|references|foreign_key|

### Association
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :category
- belongs_to :brand
- belongs_to :size_status
- belongs_to :sell_status
- has_many   :images


## image
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key|
|image|string||

### Association
- belongs_to :product


## category
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|
|belongs|string|null: false|

### Association
- has_many   :products
- has_ancestry


## brand
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


## sell_status
|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|

### Association
- has_many :products


## size
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|size_group_id|references|foreign_key|

### Association
- has_many :products
- belongs_to :size_group


## size_group
|Column|Type|Options|
|------|----|-------|
|group|string|null: false|

### Association
- has_many :sizes
