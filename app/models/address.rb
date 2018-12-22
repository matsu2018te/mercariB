class Address < ApplicationRecord
  belongs_to :user, optional: true

  #都道府県
  include JpPrefecture
  jp_prefecture :prefecture, method_name: :pref
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_phonetic, presence: true
  validates :last_name_phonetic, presence: true
  # validates :postal_code, presence: true
  # validates :prefecture, presence: true
  # validates :municipality, presence: true
  # validates :address_number, presence: true
end
