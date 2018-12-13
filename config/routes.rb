Rails.application.routes.draw do
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new", as: "new_user_registration"
    get "/signup/registration" => "devise/registrations#registration"
    get "/signup/sms_confirmation" => "devise/registrations#sms_confirmation"
    get "/signup/address" => "devise/registrations#address"
    get "/signup/credit_card" => "devise/registrations#credit_card"
    get "/signup/done" => "devise/registrations#done"
  end

  devise_for :users
end
