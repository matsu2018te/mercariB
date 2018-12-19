class Product < ApplicationRecord
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :category
  belongs_to :brand
  belongs_to :size_status
  belongs_to :area
  belongs_to :sell_status
  has_many :images
  accepts_nested_attributes_for :images

  validates :seller, :category, :area, :sell_status, presence: true
end
