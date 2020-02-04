class ProductType < ApplicationRecord
  validates :name, :description, :product_key, presence: true
  validates :name, :product_key, uniqueness: true
  validates :product_key, length: { maximum: 5 }
end
