class Plan < ApplicationRecord
  belongs_to :product_type
  validates :name, :description, :details, presence: true
end
