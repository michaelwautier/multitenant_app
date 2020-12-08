class AddReview
  include Interactor

  def call
    product_review = ProductReview.new(context.params)
    product_review.product = context.product
    context.fail! unless product_review.save
  end
end
