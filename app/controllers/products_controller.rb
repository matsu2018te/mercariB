class ProductsController < ApplicationController
  def show

  end

  def new

  end

  def create

  end

  def products_params
    params.require(:products).permit(:product_name, :product_info, :price, :category_id, :image).merge(seller_id: current_user.id)
  end
end
