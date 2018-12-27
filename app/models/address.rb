class Address < ApplicationRecord
  belongs_to :user, optional: true

  #都道府県
  include JpPrefecture
  jp_prefecture :prefecture, method_name: :pref

  #正規表現
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAME_PHONETIC = /\A[ァ-ン]+\z/
  VALID_POSTALCODE_REGEX = /\A\d{3}[-]*\d{4}\z/

  #バリデーション
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_phonetic, presence: true, format: { with: VALID_NAME_PHONETIC }
  validates :last_name_phonetic, presence: true, format: { with: VALID_NAME_PHONETIC }
  validates :postal_code, presence: true, format: { with: VALID_POSTALCODE_REGEX }
  validates :prefecture, presence: true, numericality: true
  validates :municipality, presence: true
  validates :address_number, presence: true
end
