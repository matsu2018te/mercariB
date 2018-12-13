FactoryGirl.define do

  factory :user do
    first_name            "目流化理"
    last_name             "太郎"
    fist_name_phonetic    "メルカリ"
    last_name_phonetic    "タロウ"
    telephone             "09066667543"
    birthday              "2017-04-25 21:01:27 +0900"
    nickname              "merucari"
    email                 "merucari@gmail.com"
    password              "123456"
    password_confirmation "123456"
  end

end
