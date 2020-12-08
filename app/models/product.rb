class Product < ApplicationRecord
  has_many :product_reviews

  validates :name, :description, :price_in_cents, :stock, presence: true
  validates :name, :description, length: { minimum: 2 }
  validates :price_in_cents, :stock, numericality: { greater_than_or_equal_to: 0 }
end
