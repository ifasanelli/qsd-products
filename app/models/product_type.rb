class ProductType < ApplicationRecord

  validates :name, :description, :product_key, presence: true
  
end
