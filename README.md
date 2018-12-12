# README
# mercariB

## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|fist_name_phonetic|string|null: false|
|last_name_phonetic|string|null: false|
|telephone|integer|null: false, unique: true|
|email|string|null: false|
|password|string|null: false|
|birthday|datetime|null: false|
|icon_picture|string||
|profile|text||
|background_image|string||
|point|integer||
|sns_credentials_id|references|foreign_key|

### Association
- has_many :buyer_product, class_name: 'Product', :foreign_key => 'buyer_id'
- has_many :seller_product, class_name: 'Product', :foreign_key => 'seller_id'
- has_many :user_evalutions
- has_many :evalutions, through: :user_evalutions
- has_many :credits
- has_one  :address
- has_many :sns_credentials


## user_evalution

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key|
|evaluation_id|references|foreign_key|

### Association
- belongs_to :user
- belongs_to :evaluation


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
|card_number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|null: false|
|user_id|references|foreign_key|

### Association
- belongs_to :user


## address
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|address_number|integer|null: false|
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
|product_name|string|null: false|
|product_info|text|null: false|
|price|integer|null: false|
|category_id|references|foreign_key|
|brand_id|references|foreign_key|
|size_id|references|foreign_key|
|product_state|string|null: false|
|delivery_fee_owner|string|null: false|
|area_id|references|foreign_key|
|dalivery_date|datatime|null: false|
|status_id|references|foreign_key|
|shipping_method|string|null: false|

### Association
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- belongs_to :area
- belongs_to :sell_status
- has_many   :product_images


## product_image
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key|
|product_image|string||

### Association
- belongs_to :product


## category
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key|
|product_image|string||

### Association
- belongs_to :product


## brand
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :product


## area
|Column|Type|Options|
|------|----|-------|
|prefectures|string|null: false|

### Association
- belongs_to :product


## sell_status
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- belongs_to :product


## size_status
|Column|Type|Options|
|------|----|-------|
|size|integer|null: false|

### Association
- belongs_to :product
