class Shop < ApplicationRecord
  after_create :create_tenant

  validates :name, presence: true, length: { minimum: 2 }
  validates :city, presence: true, length: { minimum: 2 }
  validates :subdomain, presence: true, length: { minimum: 2 }

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  after_destroy do |shop|
    Apartment::Tenant.drop(shop.subdomain)
  end
end
