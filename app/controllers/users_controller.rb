class UsersController < ApplicationController
  def index

  end

  def create

  end

  def new
  end

  def edit
    @user = "aaa"
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
  end

  def show

  end

  def destroy

  end

  def iden_edit
    @user = User.find(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :first_name_phonetic,
      :last_name_phonetic,
      address_attributes: [:postal_code,
                           :prefecture,
                           :municipality,
                           :address_number,
                           :building_name])
  end
end
