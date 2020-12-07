class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :city
      t.string :subdomain

      t.timestamps
    end
  end
end
