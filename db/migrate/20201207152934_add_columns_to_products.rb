class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :string
    add_column :products, :stock, :integer
    add_column :products, :price_in_cents, :float
  end
end
