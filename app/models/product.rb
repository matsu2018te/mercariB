class Product < ApplicationRecord
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size
  belongs_to :sell_status
  has_many :images
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :brand

  validates :seller, :category, :area, :sell_status, presence: true

  delivery_fee_owner status: {postage: 0,cash_on: 1}
end
