class CommentsController < ApplicationController
  before_action :set_product

  def index
    @comment = Comment.new
    @comment = @product.messages.includes(:user)
  end

  def create
    @comment = @product.comments.new(comment_params)
    if @comment.save
      redirect_to product_comments_path(@product), notice: 'コメントしました'
    else
      @comments = @product.comments.includes(:user)
      flash.now[:alert] = 'コメントを入力してください。'
      render :index
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
