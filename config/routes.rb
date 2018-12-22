Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :sessions           => "users/sessions",
    :registrations      => "users/registrations",
    :passwords          => "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'login' => 'users/sessions#new'#ログイン
    get 'signup' => 'users/registrations#signup' #新規会員登録
    get "/signup/registration" => "users/registrations#registration"#会員情報入力
    post "/signup/sms_confirmation" => "users/registrations#sms_confirmation"#電話番号入力
    post "/signup/address" => "users/registrations#address"#住所入力
    post "/signup/credit_card" => "users/registrations#credit_card"#支払い方法
    post "/signup/completed" => "users/registrations#create"
    get "/signup/done" => "users/registrations#done"#完了画面
  end

  root 'home#index'
  get 'mypage' => 'users#show'
  post 'mypage' => 'users#update'
  get 'mypage/profile' => 'users#edit'
  get 'mypage/identification' => 'users#set_user'
  get 'mypage/notification' => 'users#notification'
  get 'mypage/todo' => 'users#todo'
  get 'mypage/purchase' => 'products#purchase'
  get 'mypage/purchased' => 'products#purchased'
  patch 'mypage' => 'users#update'
  get 'mypage/logout' => 'users#destroy'
  get 'show' => 'products#show'
  get 'sell' => 'products#new'
  get 'mypage/card' => 'credits#index'
  get 'mypage/card/create' => 'credits#new'
  post 'mypage/card' => 'credits#create'
  delete 'mypage/card' => 'credits#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


