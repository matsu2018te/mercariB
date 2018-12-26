class ProductsController < ApplicationController
  before_action :product_new, only:[:new]

  def new
    @product.images.build
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
  end


  def create
    @product = Product.new(product_params)
    @product.brand = Brand.find_or_create_by(name: @product.brand.name) if @product.brand.name
    if @product.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def product_new
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(
      :name,
      :info,
      :price,
      :category_id,
      :size_id,
      :status,
      :delivery_fee_owner,
      :shipping_method,
      :delivery_date,
      :prefecture,
      images_attributes: [:id,:image],
      brand_attributes: [:name]
    ).merge(seller_id: current_user.id,sell_status_id: 1)

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
end
