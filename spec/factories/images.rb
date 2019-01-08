FactoryGirl.define do
  factory :image do
    product_id              1
    image                   "test.jpg"
    association :product, factory: :product
  end
end
