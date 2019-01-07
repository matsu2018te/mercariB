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

  def search
    @q        = Product.search(search_params)
    @keyword  = search_params[:info_or_name_or_brand_name_or_category_name_cont]
    @products = Product.order(id: :DESC).includes(:images)
    @product_result = @q.result(distinct: true)
    @product_count = @product_result.length

    @parents       = Category.where(belongs:"parent")
    gon.children   = Category.where(belongs:"child")
    gon.g_children = Category.where(belongs:"g_child")

    @size_groups = SizeGroup.all
    gon.sizes = Size.all
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

  def search_params
    params.require(:q).permit(
      :s,
      :info_or_name_or_brand_name_or_category_name_cont,
      {:category_id_in => []},
      :brand_name_cont,
      {:size_id_in => []},
      :price_gteq,
      :price_lteq,
      {:status_eq_any => []},
      {:delivery_fee_owner_eq_any => []},
      :buyer_id_null,
      :buyer_id_not_null
      ) unless params[:q].blank?
  end
end
