class Product < ApplicationRecord
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.

    belongs_to :category

    validates :title, :price, :stock_quantity, presence: true
end
