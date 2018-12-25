class ProductsController < ApplicationController
  before_action :product_new, only:[:new]
  def show

  end

  def new
    @product.images.build

  end

  def create
    @product = Product.new(product_params)
    @product.brand = Brand.find_or_create_by(name: @product.brand.name) if @product.brand.name
    binding.pry
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
      images_attributes: [:id, :image],
      brand_attributes: [:name]
    ).merge(seller_id: current_user.id,sell_status_id: 1)
  end
end
