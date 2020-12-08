require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:valid_attributes) do
    {
      name: 'RSpec Shop',
      city: 'Nivelles',
      subdomain: 'rspecshop'
    }
  end

  context '.create' do
    before(:example) { @attributes = valid_attributes }
    it 'should not be valid if no params given' do
      shop = Shop.new
      expect(shop).not_to be_valid
    end
    context 'name validation' do
      it 'should not be valid if no name is given' do
        @attributes.delete(:name)
        shop = Shop.new(@attributes)
        expect(shop).not_to be_valid
      end
      it 'should not be valid if the name is less than 2 characters' do
        @attributes[:name] = 'a'
        shop = Shop.new(@attributes)
        expect(shop).not_to be_valid
      end
    end
    context 'city validation' do
      it 'should not be valid if no city is given' do
        @attributes.delete(:city)
        shop = Shop.new(@attributes)
        expect(shop).not_to be_valid
      end
      it 'should not be valid if the city is less than 2 characters' do
        @attributes[:city] = 'a'
        shop = Shop.new(@attributes)
        expect(shop).not_to be_valid
      end
    end
    context 'subdomain validation' do
      it 'should not be valid if no subdomain is given' do
        @attributes.delete(:subdomain)
        shop = Shop.new(@attributes)
        expect(shop).not_to be_valid
      end
      it 'should not be valid if the subdomain is less than 2 characters' do
        @attributes[:subdomain] = 'a'
        shop = Shop.new(@attributes)
        expect(shop).not_to be_valid
      end
    end
    it 'should generate a new shop if all params are given' do
      shop = Shop.create!(@attributes)
      expect(shop).to be_a(Shop)
      Apartment::Tenant.drop('rspecshop')
    end
  end
  context 'instance method' do
    before(:example) { @shop = Shop.new(valid_attributes) }
    context '#name' do
      it 'has a name' do
        expect(@shop.name).to eq('RSpec Shop')
      end
      it 'name should be a string' do
        expect(@shop.name).to be_a(String)
      end
    end
    context '#city' do
      it 'has a city' do
        expect(@shop.city).to eq('Nivelles')
      end
      it 'city should be a string' do
        expect(@shop.city).to be_a(String)
      end
    end
    context '#subdomain' do
      it 'has a subdomain' do
        expect(@shop.subdomain).to eq('rspecshop')
      end
      it 'subdomain should be a string' do
        expect(@shop.subdomain).to be_a(String)
      end
    end
  end
end
