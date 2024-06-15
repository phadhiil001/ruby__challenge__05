# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# require 'faker'

# 676.times do
#     Product.create(
#     title: Faker::Commerce.product_name,
#     price: Faker::Commerce.price(range: 0.1..100.0),
#     stock_quantity: Faker::Number.between(from: 1, to: 100)
#     )
# end


require 'csv'

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

# Add encoding: 'iso-8859-1' to the parse if CSV was created Excel in Windows

products.each {
    | product_row |
    category_name = product_row['category']
    category = Category.find_or_create_by(name: category_name)

    # Create the product
    Product.create(
    title: product_row['name'],
    description: product_row['description'],
    price: product_row['price'].to_f,
    stock_quantity: product_row['stock quantity'].to_i,
    category: category
  )
}
