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

  end
end
