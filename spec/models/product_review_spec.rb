require 'rails_helper'

RSpec.describe ProductReview, type: :model do
  before(:context) do
    Apartment::Tenant.drop('rspecshop')
    Shop.create(
      name: 'RSpec Shop',
      city: 'Nivelles',
      subdomain: 'rspecshop'
    )
    Apartment::Tenant.switch!('rspecshop')

    @product = Product.create(
      name: 'RSpec Product',
      description: 'RSpec product description',
      price_in_cents: 3900,
      stock: 2
    )
  end

  after(:context) do
    Apartment::Tenant.drop('rspecshop')
  end

  let(:valid_attributes) do
    {
      content: 'RSpec review for RSpec Product#1',
      rating: 5,
      product_id: @product.id
    }
  end

  context '.create' do
    before(:example) { @attributes = valid_attributes }
    it 'should generate a new review for a product' do
      review = ProductReview.create(@attributes)
      expect(review).to be_a(ProductReview)
    end
    context 'content' do
      it 'should not be valid if it is blank' do
        @attributes.delete(:content)
        review = ProductReview.new(@attributes)
        expect(review).not_to be_valid
      end
      it 'should not be valid if it is less than 2 characters' do
        @attributes[:content] = 'a'
        review = ProductReview.new(@attributes)
        expect(review).not_to be_valid
      end
    end
    context 'rating' do
      it 'should not be valid if it is blank' do
        @attributes.delete(:rating)
        review = ProductReview.new(@attributes)
        expect(review).not_to be_valid
      end
      it 'should be a number between 0 and 5' do
        (0..5).each do |rating|
          @attributes[:rating] = rating
          review = ProductReview.new(@attributes)
          expect(review).to be_valid
        end
        expect(ProductReview.new(@attributes.merge(rating: -1))).not_to be_valid
        expect(ProductReview.new(@attributes.merge(rating: 6))).not_to be_valid
      end
    end
  end
  context 'instance method' do
    before(:example) { @product_review = ProductReview.new(valid_attributes) }
    context '#content' do
      it 'has a content' do
        expect(@product_review.content).to eq('RSpec review for RSpec Product#1')
      end
      it 'content should be a string' do
        expect(@product_review.content).to be_a(String)
      end
    end
    context '#rating' do
      it 'has a rating' do
        expect(@product_review.rating).to eq(5)
      end
      it 'rating should be an integer' do
        expect(@product_review.rating).to be_a(Integer)
      end
    end
    context '#product' do
      it 'belongs to a product' do
        expect(@product_review).to respond_to(:product)
      end
    end
  end
end
