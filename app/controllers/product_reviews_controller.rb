class ProductReviewsController < ApplicationController
  def new
    @product_review = ProductReview.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product_review = ProductReview.new(product_review_params)
    @product = Product.find(params[:product_id])
    @product_review.product = @product
    @product_review.save
    redirect_to product_path(@product)
  end

  private

  def product_review_params
    params.require(:product_review).permit(:content, :rating)
  end
end
