class ProductsController < ApplicationController

  def new
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
    @sell_user = @product.seller
    @sell_other_products = Product.where(seller_id: @product.seller_id)
    @sell_product_brand = Brand.find_by(id: @product.brand_id)
    @sell_product_category = Category.find_by(id: @product.category_id)

    if @product.brand_id.present? && @product.category_id.present?
      @related_items = Product.where(brand_id: @product.brand_id, category_id: @product.category_id)
    else @product.brand_id.present? || @product.category_id.present?
      @related_items = Product.where("brand_id = ? or category_id = ?", @product.brand_id, @product.category_id)
    end
    # binding.pry

  end

    def transaction
      @product = Product.find(params[:id])
      @product.update(buyer_id: current_user.id)
    end

end
