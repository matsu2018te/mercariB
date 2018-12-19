class CreditsController < ApplicationController
  def index
    @credit = current_user.credit
  end

  def new
    @credit = Credit.new
  end

  def create
    Credit.create(credit_params)
  end

  def destroy
    credit = current_user.credit
    if credit.destroy
      redirect_to mypage_card_path
    else
      render mypage_card_path
    end
  end

  private
  def credit_params
    params.require(:credit).permit(:card_number, :security_code, :expiration_month, :expiration_year).merge(user_id: current_user.id)
  end
end
