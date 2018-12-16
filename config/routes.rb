Rails.application.routes.draw do
  devise_scope :user do
<<<<<<< HEAD
    get 'login' => 'devise/sessions#new'#ログイン
    get 'signup' => 'devise/registrations#signup' #新規会員登録
    get "/signup/registration" => "devise/registrations#new"#会員情報入力
=======
    get "/login" => "devise/sessions#new" #ログイン
    get "/signup" => "devise/registrations#new", as: "new_user_registration" #新規会員登録
    get "/signup/registration" => "devise/registrations#registration"#会員情報入力
>>>>>>> matsu2018te/master
    get "/signup/sms_confirmation" => "devise/registrations#sms_confirmation"#電話番号入力
    get "/signup/address" => "devise/registrations#address"#住所入力
    get "/signup/credit_card" => "devise/registrations#credit_card"#支払い方法
    get "/signup/done" => "devise/registrations#done"#完了画面
  end

<<<<<<< HEAD
=======

  root 'home#index'
>>>>>>> matsu2018te/master
  devise_for :users
  get 'mypage' => 'users#show'
  get 'mypage/profile' => 'users#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
