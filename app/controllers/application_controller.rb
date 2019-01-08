class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :category_search
  before_action :search_variable
  before_action :user_logged_in?

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

  def category_search
    @parents = Category.where(belongs: "parent")
    @brands = Brand.all
  end

  def search_variable
    @search_data = Product.ransack(params[:info_name_or_brand_name_or_category_name_cont_all])
  end

  def user_logged_in?
    if session[:user_id]
      begin
        @current_user = User.find_by(id: session[:user_id])
      rescue
        reset_user_session
      end
    end
    # binding.pry
    return if @current_user
    # @current_userが取得できなかった場合はログイン画面にリダイレクト
    flash[:referer] = request.fullpath
    redirect_to new_user_session_path
  end

  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end

end
