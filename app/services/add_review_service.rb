class AddReviewService < ApplicationService
  attr_reader :content, :rating

  def initialize(params, product)
    @review = ProductReview.new(params)
    @product = product
  end

  def call
    @review.product = @product
    return true if @review.save
  end
end
