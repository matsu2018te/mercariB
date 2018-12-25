class Product < ApplicationRecord
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size
  belongs_to :sell_status
  has_many :images
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :brand

  validates :seller,:name,:info, :category_id, :status, :delivery_fee_owner, :shipping_method, :delivery_date, :price, presence: true
end
# = i.file_field :image, class: "upload-product-image hidden"

# = f.fields_for :images do |i|
#             = i.file_field :image, class: "upload-product-image"

# = i.label :image,class: 'sell-dropbox-uploader_container' do
# = i.file_field :image,class: "hidden"
