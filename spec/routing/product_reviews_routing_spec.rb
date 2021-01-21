require 'rails_helper'

begin
  require 'product_reviews_controller'
rescue LoadError
end

if defined?(ProductReviewsController)
  RSpec.describe 'Product reviews routes', type: :routing do
    before(:context) do
      Shop.create(
        name: 'RSpec Shop',
        city: 'Nivelles',
        subdomain: 'rspecshop'
      )
      Apartment::Tenant.switch!('rspecshop')
    end

    after(:context) do
      Apartment::Tenant.drop('rspecshop')
    end

    let(:path) do
      'http://rspecshop.lvh.me/products/1/product_reviews'
    end

    describe 'routing' do
      it 'routes to #new' do
        expect(get: "#{path}/new").to route_to(controller: 'product_reviews', action: 'new', product_id: '1')
      end

      it 'routes to #create' do
        expect(post: "#{path}").to route_to(controller: 'product_reviews', action: 'create', product_id: '1')
      end
    end
  end
end
