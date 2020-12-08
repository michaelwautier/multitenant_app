class AddReviewService < ApplicationService
  attr_reader :content, :rating

  def initialize(params, product)
    @content = params[:content]
    @rating = params[:rating]
    @product = product
  end

  def call
    review = ProductReview.new(content: @content, rating: @rating)
    review.product = @product
    return true if review.save
    return false
  end
end
