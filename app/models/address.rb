class Address < ApplicationRecord
  belongs_to :user

  #都道府県
  include JpPrefecture
  jp_prefecture :prefecture, method_name: :pref
end
