require 'rails_helper'

RSpec.describe Product, type: :model do
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

  let(:valid_attributes) do
    {
      name: 'RSpec product',
      description: 'RSpec product description',
      price_in_cents: 3900,
      stock: 2
    }
  end

  context '.create' do
    before(:example) { @attributes = valid_attributes }
    it 'should generate a new product if all params are given' do
      product = Product.create(@attributes)
      expect(product).to be_a(Product)
    end
    it 'should not generate a new product if no params are given' do
      product = Product.new
      expect(product).not_to be_valid
    end
    context 'name validation' do
      it 'should not be valid if no name is given' do
        @attributes.delete(:name)
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
      it 'should not be valid if the name is less than 2 characters' do
        @attributes[:name] = 'a'
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
    end
    context 'description validation' do
      it 'should not be valid if no description is given' do
        @attributes.delete(:description)
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
      it 'should not be valid if the description is less than 2 characters' do
        @attributes[:description] = 'a'
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
    end
    context 'stock validation' do
      it 'should not be valid if no stock is given' do
        @attributes.delete(:stock)
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
      it 'should not be valid if the stock is smaller than 0' do
        @attributes[:stock] = -1
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
    end
    context 'price validation' do
      it 'should not be valid if no price is given' do
        @attributes.delete(:price_in_cents)
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
      it 'should not be valid if the price is smaller than 0' do
        @attributes[:price_in_cents] = -1
        product = Product.new(@attributes)
        expect(product).not_to be_valid
      end
    end
  end
  context 'instance method' do
    before(:example) { @product = Product.new(valid_attributes) }
    context '#name' do
      it 'has a name' do
        expect(@product.name).to eq('RSpec product')
      end
      it 'name should be a string' do
        expect(@product.name).to be_a(String)
      end
    end
    context '#description' do
      it 'has a description' do
        expect(@product.description).to eq('RSpec product description')
      end
      it 'description should be a string' do
        expect(@product.description).to be_a(String)
      end
    end
    context '#stock' do
      it 'has a stock' do
        expect(@product.stock).to eq(2)
      end
      it 'stock should be an integer' do
        expect(@product.stock).to be_a(Integer)
      end
    end
    context '#price_in_cents' do
      it 'has a price_in_cents' do
        expect(@product.price_in_cents).to eq(3900)
      end
      it 'price_in_cents should be an integer' do
        expect(@product.price_in_cents).to be_a(Integer)
      end
    end
    context '#product_reviews' do
      it 'has many reviews' do
        expect(@product).to respond_to(:product_reviews)
      end
    end
  end
end
