Rails.application.routes.draw do
  root 'home#index'
  devise_scope :user do
    get 'login' => 'devise/sessions#new'#ログイン
    get 'signup' => 'devise/registrations#signup' #新規会員登録
    get "/signup/registration" => "devise/registrations#new"#会員情報入力
    post "/signup/sms_confirmation" => "devise/registrations#sms_confirmation"#電話番号入力
    post "/signup/address" => "devise/registrations#address"#住所入力
    post "/signup/credit_card" => "devise/registrations#credit_card"#支払い方法
    post "/signup/done" => "devise/registrations#edit"#完了画面
  end


  devise_for :users
  get 'mypage' => 'users#show'
  post 'mypage' => 'users#update'
  get 'mypage/profile' => 'users#edit'
  get 'mypage/identification' => 'users#set_user'
  patch 'mypage' => 'users#update'
  get 'mypage/logout' => 'users#destroy'
  get 'show' => 'products#show'
  get 'mypage/card' => 'credits#index'
  get 'mypage/card/create' => 'credits#new'
  post 'mypage/card' => 'credits#create'
  delete 'mypage/card' => 'credits#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
