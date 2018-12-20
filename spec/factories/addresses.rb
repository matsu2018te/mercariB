FactoryGirl.define do

  factory :address do
    user
    postal_code            "123-456"
    prefecture             "東京都"
    municipality    "小金井市"
    address_number    "北町3丁目"
  end

end
