class ProductsController < ApplicationController

  def new
  end

  def show
    @product = Product.find(params[:id])
    # クリックした商品の情報
    @images = @product.images
    # クリックした商品に紐づく商品画像4枚
    @user = @product.seller
    # クリックした商品に紐づく出品者のユーザー情報
    @sell_items = Product.where(seller_id: @product.seller_id)
    # クリックした商品の出品者が出品している他の商品の情報
    @brand = Brand.find_by(id: @product.brand_id)
    @category = Category.find_by(id: @product.category_id)

    if @product.brand_id.present? && @product.category_id.present?
      @related_items = Product.where(brand_id: @product.brand_id, category_id: @product.category_id)
    else @product.brand_id.present? || @product.category_id.present?
      @related_items = Product.where("brand_id = ? or category_id = ?", @product.brand_id, @product.category_id)
    end

    def transaction
      # @product = Product.find(params[:id])
      # @product.update(buyer_id: current_user.id)
    end

end
