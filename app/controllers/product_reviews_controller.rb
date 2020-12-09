class ProductReviewsController < ApplicationController
  before_action :set_product, only: :create

  def new
    @product_review = ProductReview.new
    @product = Product.find(params[:product_id])
  end

  def create
    # WITH SERVICE
    @product_review = ProductReview.new(product_review_params)
    if AddReviewService.call(product_review_params, @product)
      redirect_to product_path(@product)
    else
      render :new
    end

    # WITH INTERACTOR
    # result = AddReview.call(params: product_review_params, product: @product)

    # if result.success?
    #   redirect_to product_path(@product)
    # else
    #   render :new
    # end

    # VANILLA
    # @product_review = ProductReview.new(product_review_params)
    # @product_review.product = @product
    # if @product_review.save
    #   redirect_to product_path(@product)
    # else
    #   render :new
    # end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_review_params
    params.require(:product_review).permit(:content, :rating)
  end
end
