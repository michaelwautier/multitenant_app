class Shop < ApplicationRecord
  after_create :create_tenant
  has_many :products
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
