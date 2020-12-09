require 'rails_helper'

begin
  require "shops_controller"
rescue LoadError
end

if defined?(ShopsController)
  RSpec.describe ShopsController, type: :controller do
    let(:valid_attributes) do
      {
        name: 'RSpec Shop',
        city: 'Nivelles',
        subdomain: 'rspecshop'
      }
    end

    let(:invalid_attributes) do
      { name: '' }
    end

    describe 'GET index' do
      it 'assigns @shops' do
        shop = Shop.create(valid_attributes)
        get :index
        expect(assigns(:shops)).to eq(Shop.all)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end
  end
end
