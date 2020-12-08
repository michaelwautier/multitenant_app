class ProductReviewsController < ApplicationController
  before_action :set_product, only: :create

  def new
    @product_review = ProductReview.new
    @product = Product.find(params[:product_id])
  end

  def create
    result = AddReview.call(params: product_review_params, product: @product)

    if result.success?
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_review_params
    params.require(:product_review).permit(:content, :rating)
  end
end
