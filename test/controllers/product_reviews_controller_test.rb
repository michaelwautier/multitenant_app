require 'test_helper'

class ProductReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get product_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get product_reviews_create_url
    assert_response :success
  end

end
