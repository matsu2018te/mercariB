FactoryGirl.define do
    factory :sns_credential do
      email "merucari@gmail.com"
      uid "1111111111"
      provider "facebook"
      confirmed_at Time.now
    end
end
