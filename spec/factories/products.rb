FactoryGirl.define do

  factory :product do
    # seller_id                u
    # buyer_id                 u
    name                     "りんご"
    info                     "美味しいりんご"
    price                    "500"
    status                   "出品中"
    delivery_fee_owner       "送料込み（出品者負担）"
    prefecture               1
    delivery_date            "2017-04-25 21:01:27 +0900"
    shipping_method          "らくらくメルカリ便"
    category_id              "160"
    brand_id                 1
    sell_status_id           1
    size_id                  1
    category
    brand
    sell_status
    size
    association :seller, factory: :user
  end


end
