require 'rails_helper'

begin
  require 'products_controller'
rescue LoadError
end

if defined?(ProductsController)
  RSpec.describe 'Products routes', type: :routing do
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
      'http://rspecshop.lvh.me/products'
    end

    describe 'routing' do
      it 'routes to #index' do
        expect(get: "#{path}").to route_to(controller: 'products', action: 'index')
      end

      it 'routes to #new' do
        expect(get: "#{path}/new").to route_to(controller: 'products', action: 'new')
      end

      it 'routes to #create' do
        expect(post: path).to route_to(controller: 'products', action: 'create')
      end

      it 'routes to #show' do
        expect(get: "#{path}/1").to route_to(controller: 'products', action: 'show', id: '1')
      end

      it 'routes to #edit' do
        expect(get: "#{path}/1/edit").to route_to(controller: 'products', action: 'edit', id: '1')
      end

      it 'routes to #update' do
        expect(patch: "#{path}/1").to route_to(controller: 'products', action: 'update', id: '1')
      end

      it 'routes to #update' do
        expect(patch: "#{path}/1").to route_to(controller: 'products', action: 'update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: "#{path}/1").to route_to(controller: 'products', action: 'destroy', id: '1')
      end
    end
  end
end
