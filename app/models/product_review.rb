class ProductReview < ApplicationRecord
  belongs_to :product

  validates :content, presence: true, length: { minimum: 2 }
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: (0..5) }
end
