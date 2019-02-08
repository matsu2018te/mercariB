class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :require_no_authentication, only: [:create]
  prepend_before_action :require_no_authentication, only: [:sms_confirmation, :address, :credit, :create]
  skip_before_action :authenticate_user!

  def registration

  end

  def sms_confirmation
    session[:nickname] = params[:session][:nickname]
    session[:email] = params[:session][:email]
    session[:password] = params[:session][:password]
    session[:password_confirmation] = params[:session][:password_confirmation]

    unless verify_recaptcha
      render action: :registration
    end
  end

  def address

    session[:telephone] = params[:session][:telephone]

  end

  def credit
    session[:first_name] = params[:session][:first_name]
    session[:last_name] = params[:session][:last_name]
    session[:first_name_phonetic] = params[:session][:first_name_phonetic]
    session[:last_name_phonetic] = params[:session][:last_name_phonetic]
    session[:postal_code] = params[:session][:postal_code]
    session[:prefecture] = params[:session][:prefecture]
    session[:municipality] = params[:session][:municipality]
    session[:address_number] = params[:session][:address_number]
    session[:building_name] = params[:session][:building_name]

    time = Time.new
    min_year = time.year.to_s[2,2].to_i
    max_year = min_year + 10
    @years = [*(min_year..max_year)]
  end

  def done


  end

  def create
    session[:card_number] = params[:session][:card_number]
    session[:expiration_month] = params[:session][:expiration_month]
    session[:expiration_year] = params[:session][:expiration_year]
    session[:security_code] = params[:session][:security_code]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      telephone: session[:telephone]
      )
    @user.address = @user.build_address(
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_phonetic: session[:first_name_phonetic],
      last_name_phonetic: session[:last_name_phonetic],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      municipality: session[:municipality],
      address_number: session[:address_number],
      building_name: session[:building_name]
      )
    @user.credits << @user.credits.build(
      card_number: session[:card_number],
      expiration_month: session[:expiration_month],
      expiration_year: session[:expiration_year],
      security_code: session[:security_code]
      )

    @user.save
    @user.address.save
    @user.credits.each do |credit|
      credit.save
    end

    session[:user_id] = @user.id
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
      render action: :registration
      clean_up_passwords resource
      set_minimum_password_length
    end
  end

  private

  def user_new
    @user = User.new(user_params)
  end

  def after_sign_up_path_for(resource)
    signup_done_path
  end

  def after_failed_sign_up_path_for(resource)
    signup_registration_path
  end

end
