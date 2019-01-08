FactoryGirl.define do

  factory :size do
    id                1
    size              "XXS以下"
    size_group_id     1
    association :size_group, factory: :size_group
  end
end
