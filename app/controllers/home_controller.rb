class HomeController < ApplicationController
  def index
    @products = Product.order("id DESC").limit(4)
    @ladies = @products.where(category_id: '').limit(4)
    @mens = @products.where(category_id: '').limit(4)
    @baby = @products.where(category_id: '').limit(4)
    @cosme = @products.where(category_id: '').limit(4)
    @chanel = @products.where(brand: '').limit(4)
    @louisvuitton = @products.where(brand: '').limit(4)
    @supreme = @products.where(brand: '').limit(4)
    @nike = @products.where(brand: '').limit(4)
  end
end
