class CreditsController < ApplicationController
  def index
    @credits = current_user.credits
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to mypage_card_path
    else
      render :new
    end
  end

  def destroy
    credit = current_user.credits
    if credit.destroy
      redirect_to mypage_card_path
    else
      render :index
    end
  end

  private
  def credit_params
    params.require(:credit).permit(:card_number, :security_code, :expiration_month, :expiration_year).merge(user_id: current_user.id)
  end
end
