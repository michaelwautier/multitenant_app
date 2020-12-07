class Shop < ApplicationRecord
  after_create :create_tenant
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  after_destroy do |shop|
    Apartment::Tenant.drop(shop.subdomain)
  end
end
