class ProductsController < ApplicationController
  before_action :product_new, only:[:create]
  def show

  end

  def new

  end

  def create
    binding.pry
    if @product.save
      redirect_to home_path
    else
      render action: :sell
    end
  end

  private
  def product_new
    @product = Product.new
  end

  def products_params
    params.require(:products).permit(
      :product_name,
      :product_info,
      :price,
      :category_id,
      :size_id,
      :product_status,
      :delivery_fee_owner,
      :area,
      :delivery_date,
      :image_id,
      brand_attributes: [:name]
    ).merge(seller_id: current_user.id,sell_status_id: 1)
  end
end
