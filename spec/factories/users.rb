FactoryGirl.define do

  factory :user do
    first_name            "目流化理"
    last_name             "太郎"
    first_name_phonetic    "メルカリ"
    last_name_phonetic    "タロウ"
    telephone             "09066667543"
    nickname              "merucari"
    email                 "merucari@gmail.com"
    password              "123456"
    password_confirmation "123456"

    after :create do |u|
      create(:address, user: u) # create(:profile, user_id: u.id) と同義
      u.reload
    end
  end

  factory :product do
    seller_id            "1"
    buyer_id             "1"
    product_name    "りんご"
    product_info    "美味しいりんご"
    price             "500"
    product_state              "出品中"
    delivery_fee_owner              "送料込み（出品者負担）"
    delivery_data                 "2017-04-25 21:01:27 +0900"
    shipping_method              "らくらくメルカリ便"
  end

end
