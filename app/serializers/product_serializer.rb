class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :stock, :reviews

  def name
    object.name.upcase
  end

  def description
    object.description.downcase
  end

  def price
    { in_cents: object.price_in_cents,
      formatted: object.price_in_cents.fdiv(100) }
  end

  def reviews
    object.product_reviews.map do |review|
      { id: review.id,
        content: review.content,
        rating: review.rating }
    end
  end
end
