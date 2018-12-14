Rails.application.routes.draw do
  devise_for :users
  get 'mypage' => 'users#show'
  get 'mypage/profile' => 'users#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
