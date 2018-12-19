class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :require_no_authentication, only: [:create]
  before_action :user_new, only:[:sms_confirmation, :address, :credit_card, :create]

  def registration
    @user = User.new

  end

  def sms_confirmation
    @user.build_address
  end

  def address
    @user.build_address
  end

  def credit_card
    @user.credit_cards.build
  end

  def done

  end

  def create

    @user.save
    redirect_to new_user_create_done_path
    # yield resource if block_given?
    # if resource.persisted?
    #   if resource.active_for_authentication?
    #     set_flash_message! :notice, :signed_up
    #     sign_up(@user, current_user)
    #     respond_with resource, location: after_sign_up_path_for(resource)
    #   else
    #     set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
    #     expire_data_after_sign_in!
    #     respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #   end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end
  end

  private

  def user_new
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :telephone, :first_name, :first_name, :last_name, :first_name_phonetic, :last_name_phonetic, address_attributes: [:id, :postal_code, :prefecture, :municipality, :address_number, :building_name],
      credit_cards_attributes: [:id, :card_number, :expiration_date, :security_code])
    #  :birthday,
  end

  # def after_sign_up_path_for(resource)
  #   new_user_create_done_path
  # end



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
