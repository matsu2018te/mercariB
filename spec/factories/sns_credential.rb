FactoryGirl.define do
    factory :sns_credential do
        email "rspec_test@test.com"
        uid "1111111111"
        provider "facebook"
        username "anonymous"
        confirmed_at Time.now
    end
end
