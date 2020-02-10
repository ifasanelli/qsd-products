class Plan < ApplicationRecord
  belongs_to :product_type

  validates :name, presence: true
end
