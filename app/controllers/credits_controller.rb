class CreditsController < ApplicationController
  def index
    @credits = current_user.credits
  end

  def new
    @credit = Credit.new

    time = Time.new
    min_year = time.year.to_s[2,2].to_i
    max_year = min_year + 10
    @years = [*(min_year..max_year)]
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to card_path
    else
      render :new
    end
  end

  def destroy
    credit = Credit.find(params[:id])
    if credit.user_id == current_user.id
      if credit.destroy
        redirect_to card_path
      else
        render :index
      end
    end
  end

  private
  def credit_params
    params.require(:credit).permit(:card_number, :security_code, :expiration_month, :expiration_year).merge(user_id: current_user.id)
  end
end
