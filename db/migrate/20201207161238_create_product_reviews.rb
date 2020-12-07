class CreateProductReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :product_reviews do |t|
      t.string :content
      t.integer :rating
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
