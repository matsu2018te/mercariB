Rails.application.routes.draw do
  devise_scope :user do
    get "/login" => "devise/sessions#new" #ログイン
    get "/signup" => "devise/registrations#new", as: "new_user_registration" #新規会員登録
    get "/signup/registration" => "devise/registrations#registration"#会員情報入力
    get "/signup/sms_confirmation" => "devise/registrations#sms_confirmation"#電話番号入力
    get "/signup/address" => "devise/registrations#address"#住所入力
    get "/signup/credit_card" => "devise/registrations#credit_card"#支払い方法
    get "/signup/done" => "devise/registrations#done"#完了画面
  end

  devise_for :users
end
