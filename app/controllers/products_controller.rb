class ProductsController < ApplicationController

  before_action :product_info, only: [:show, :item_show]

  def new
  end

  def show
    @images = @product.images

    if @product.brand_id.present? && @product.category_id.present?
      @related_items = Product.where(brand_id: @product.brand_id, category_id: @product.category_id)
    else @product.brand_id.present? || @product.category_id.present?
      @related_items = Product.where("brand_id = ? or category_id = ?", @product.brand_id, @product.category_id)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id == @product.seller_id
      if @product.destroy
        redirect_to root_path
      else
        render :show
      end
    end
    binding.pry
  end

  def transaction
    @product = Product.find(params[:id])
    @product.update(buyer_id: current_user.id)
  end

  def item_show
    @image = @product.images[0]
  end

  private
  def product_info
    @product = Product.find(params[:id])
    @sell_user = @product.seller
    @sell_other_products = Product.where(seller_id: @product.seller_id)
    @sell_product_brand = Brand.find_by(id: @product.brand_id)
    @sell_product_category = Category.find_by(id: @product.category_id)
  end

end
