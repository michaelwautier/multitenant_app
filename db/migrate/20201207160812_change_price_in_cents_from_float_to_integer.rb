class ChangePriceInCentsFromFloatToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price_in_cents, :integer
  end
end
