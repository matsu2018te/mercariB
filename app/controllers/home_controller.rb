class HomeController < ApplicationController
  def index
    @products = Product.order("id DESC").limit(4)
  end
end
