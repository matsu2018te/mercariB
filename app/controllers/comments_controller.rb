class CommentsController < ApplicationController
  before_action :set_product

  def index

  end

  def create

  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

end
