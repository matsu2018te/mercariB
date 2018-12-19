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
  end

  private
  def credit_params
    params.require(:credit).permit(:card_number, :security_code, :expiration_month, :expiration_year).merge(user_id: current_user.id)
  end
end
