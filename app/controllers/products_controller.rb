class ProductsController < ApplicationController

  before_action :product_info, only: [:show, :item_show, :destroy]

  def new
  end

  def show
    @images = @product.images
    @sell_user = @product.seller
    @sell_other_products = Product.where(seller_id: @product.seller_id)
    @sell_product_brand = @product.brand
    @sell_product_category = @product.category

    if @product.brand_id.present? && @product.category_id.present?
      @related_items = Product.where(brand_id: @product.brand_id, category_id: @product.category_id)
    else @product.brand_id.present? || @product.category_id.present?
      @related_items = Product.where("brand_id = ? or category_id = ?", @product.brand_id, @product.category_id)
    end
  end

  def destroy
    if current_user.id == @product.seller_id
      if @product.destroy
        redirect_to root_path
      else
        render :show
      end
    end
  end

  def item_show
    @image = @product.images[0]
  end

  def transaction
    @product = Product.find(params[:format])
  end

  def completed_transaction
    ActiveRecord::Base.transaction do

      @product = Product.find(params[:id])
      require 'payjp'
      Payjp.api_key = PAYJP_SECRET_KEY

      Payjp::Charge.create(
        amount:  @product.price,
        card:    params['payjp-token'],
        currency: 'jpy',
      )
      @product.update!(buyer_id: current_user.id)
    end
  end

  private
  def product_info
    @product = Product.find(params[:id])
  end
end
