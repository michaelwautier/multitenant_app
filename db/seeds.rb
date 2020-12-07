# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shop.destroy_all

puts 'Creating 3 shops...'
Shop.create(name: 'Shop#1', city: 'Nivelles', subdomain: 'shopone')
Shop.create(name: 'Shop#2', city: 'Nivelles', subdomain: 'shoptwo')
Shop.create(name: 'Shop#3', city: 'Nivelles', subdomain: 'shopthree')

puts 'Creating 3 products for shop 1...'
Apartment::Tenant.switch!('shopone')
Product.create(name: 'Product#1 of shop#1', description: 'Description of product #1, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
Product.create(name: 'Product#2 of shop#1', description: 'Description of product #2, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
Product.create(name: 'Product#3 of shop#1', description: 'Description of product #3, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)

puts 'Creating 3 products for shop 2...'
Apartment::Tenant.switch!('shoptwo')
Product.create(name: 'Product#1 of shop#2', description: 'Description of product #1, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
Product.create(name: 'Product#2 of shop#2', description: 'Description of product #2, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
Product.create(name: 'Product#3 of shop#2', description: 'Description of product #3, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)

puts 'Creating 3 products for shop 3...'
Apartment::Tenant.switch!('shopthree')
Product.create(name: 'Product#1 of shop#3', description: 'Description of product #1, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
Product.create(name: 'Product#2 of shop#3', description: 'Description of product #2, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
Product.create(name: 'Product#3 of shop#3', description: 'Description of product #3, lorem ipsum dolor samet', stock: 2, price_in_cents: 2500)
