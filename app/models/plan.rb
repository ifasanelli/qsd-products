class Plan < ApplicationRecord
  belongs_to :product_type

  enum status: { available: 0, unavailable: 5 }

  validates :name, presence: true
end
