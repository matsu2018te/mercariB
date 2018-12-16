class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  private

  def configure_permitted_parameters
    added_attrs = [ :nickname, :first_name, :last_name, :fist_name_phonetic, :last_name_phonetic, :telephone, :birth_year, :birth_month, :birth_day, :icon_picture, :profile, :background_image, :point]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
