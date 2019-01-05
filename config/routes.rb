Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :sessions           => "users/sessions",
    :registrations      => "users/registrations",
    :passwords          => "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  },
  skip: [:sessions, :registrations]
  as :user do
    #ログイン
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    #ログアウト
    match 'mypage/logout' => 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
    get 'mypage/logout' => 'users#destroy'
    #サインアップ
    get 'signup' => 'users/registrations#signup'#新規会員登録
    get "/signup/registration" => "users/registrations#registration"#会員情報入力
    post "/signup/sms_confirmation" => "users/registrations#sms_confirmation"#電話番号入力
    post "/signup/address" => "users/registrations#address"#住所入力
    post "/signup/credit_card" => "users/registrations#credit"#支払い方法
    post "/signup/completed" => "users/registrations#create"
    get "/signup/done" => "users/registrations#done"#完了画面
  end

  root 'home#index'

  #user関連
  get 'mypage' => 'users#show'
  patch 'mypage' => 'users#update'
  get 'mypage/profile' => 'users#edit'
  get 'mypage/identification' => 'users#set_user'
  get 'mypage/notification' => 'users#notification'
  get 'mypage/todo' => 'users#todo'

  #products関連
  resources :products, except: [:new] do
    collection do
      get 'search'
      post 'completed_transaction'
    end
  end
  get 'mypage/purchase' => 'products#purchase'
  get 'mypage/purchased' => 'products#purchased'
  get 'sell' => 'products#new'
  post 'sell' => 'products#create'
  get 'brand/index' => 'brands#index'
  get 'transaction' => 'products#transaction'
  get 'items/:id' => 'products#item_show'

  scope '/mypage' do
    #クレジットカード
    resources "credits", :path => 'card', only: [:index, :destroy]
    get 'card/create' => 'credits#new'
    post 'card' => 'credits#create'
  end

end

