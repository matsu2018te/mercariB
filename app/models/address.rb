class Address < ApplicationRecord
  belongs_to :user

  #都道府県
  include JpPrefecture
  jp_prefecture :prefecture, method_name: :pref
  # validates :postal_code, presence: true
  # validates :prefecture, presence: true
  # validates :municipality, presence: true
  # validates :address_number, presence: true
end
