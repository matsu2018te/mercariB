class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :require_no_authentication, only: [:create]
  prepend_before_action :require_no_authentication, only: [:sms_confirmation, :address, :credit, :create]
  before_action :user_new, only:[:sms_confirmation, :address, :credit, :create]

  def registration
    @user = User.new
    if verify_recaptcha(model: @user) && @user.save
      redirect_to signup_sms_confirmation_path
    else
      render 'registration'
    end
  end

  def sms_confirmation
    # @user.build_address

  end

  def address
    @user.build_address
  end

  def credit
    @user.credits.build
  end

  def done

  end

  def create
    @user.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(@user, current_user)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    # if @user.save
    #   redirect_to signup_done_path
    # else
    #   redirect_to signup_registration_path
    # end
  end

  private

  def user_new
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :telephone, address_attributes: [ :first_name, :first_name, :last_name, :first_name_phonetic, :last_name_phonetic, :id, :postal_code, :prefecture, :municipality, :address_number, :building_name],
      credits_attributes: [:id, :card_number, :expiration_month, :expiration_year, :security_code])
    #  :birth_year,birth_month,birth_day,
  end

  def after_sign_up_path_for(resource)
    signup_done_path
  end

end
