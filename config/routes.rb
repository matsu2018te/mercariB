Rails.application.routes.draw do
  devise_scope :user do
    get 'login' => 'devise/sessions#new'#ログイン
    get 'signup' => 'devise/registrations#signup' #新規会員登録
    get "/signup/registration" => "devise/registrations#new"#会員情報入力
    get "/signup/sms_confirmation" => "devise/registrations#sms_confirmation"#電話番号入力
    get "/signup/address" => "devise/registrations#address"#住所入力
    get "/signup/credit_card" => "devise/registrations#credit_card"#支払い方法
    get "/signup/done" => "devise/registrations#done"#完了画面
  end

  root 'home#index'
  devise_for :users
  get 'mypage' => 'users#show'
  post 'mypage' => 'users#update'
  get 'mypage/profile' => 'users#edit'
  get 'mypage/identification' => 'users#set_user'
  patch 'mypage' => 'users#update'
  get 'mypage/logout' => 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
