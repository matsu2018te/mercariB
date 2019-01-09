class HomeController < ApplicationController
    skip_before_action :authenticate_user!
  def index
    @products = Product.order("id DESC").limit(4)

    ladies = Category.where("ancestry LIKE ?", "1/%")
    ladies_ids = ladies.map{|lady| lady.id }
    @lady_products = Product.where(category_id:ladies_ids).limit(4)

    mens = Category.where("ancestry LIKE ?", "2/%")
    mens_ids = mens.map{|mens| mens.id }
    @mens_products = Product.where(category_id:mens_ids).limit(4)

    kids = Category.where("ancestry LIKE ?", "3/%")
    kids_ids = kids.map{|kids| kids.id }
    @kids_products = Product.where(category_id:kids_ids).limit(4)

    cosme = Category.where("ancestry LIKE ?", "7/%")
    cosme_ids = cosme.map{|cosme| cosme.id }
    @cosme_products = Product.where(category_id:cosme_ids).limit(4)

    @chanel = @products.where(brand_id: 1).limit(4)
    @louisvuitton = @products.where(brand_id: 2).limit(4)
    @supreme = @products.where(brand_id: 3).limit(4)
    @nike = @products.where(brand_id: 4).limit(4)

  end
end

