class ProductsController < ApplicationController
  before_action :product_new, only:[:new]
  before_action :product_info, only: [:show, :item_show, :destroy]

  def new
    @product.images.build
  end

  def show
    @images = @product.images
    gon.images = @images.length
    @sell_user = @product.seller
    @sell_other_products = Product.where(seller_id: @product.seller_id)
    @sell_product_brand = @product.brand
    @sell_product_category = @product.category

    if @product.brand_id.present? && @product.category_id.present?
      @related_items = Product.where(brand_id: @product.brand_id, category_id: @product.category_id).where.not(id: @product.id)
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

  def create
    @product = Product.new(product_params)
    if @product.brand
      @product.brand = Brand.find_or_create_by(name: @product.brand.name)
    end
    if @product.save
      redirect_to root_path
    else
      render action: :new
    end
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
      @product.update!(buyer_id: current_user.id,sell_status_id: 2)
    end
  end

  #ユーザー出品商品一覧
  def listing
    @products = Product.where(seller_id: current_user.id, buyer_id: nil)
  end

  def in_progress
    @products = Product.where(seller_id: current_user.id).where.not(buyer_id: nil)
  end

  def completed
    @products = Product.where(seller_id: current_user.id).where.not(buyer_id: nil)
  end

  #ユーザー購入済み商品一覧
  def purchased
    @product = Product.where(buyer_id: current_user.id, sell_status_id: 2)
  end

  # 商品価格査定
  def price_recommend
    @product = PriceRecommend.new
  end

  def price_recommend_result
    @product = PriceRecommend.new(recommend_params)
    @same_product = Product.search(recommend_params)
    @same_product_price = @same_product.average(:price).floor.to_s(:delimited) if @same_product.present?
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
  end

  def product_info
    @product = Product.find(params[:id])
  end

  def recommend_params
    params.require(:price_recommend).permit(
      :category_id,
      :brand_id,
      :status)
  end
end
