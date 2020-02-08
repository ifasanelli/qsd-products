class Price < ApplicationRecord
  belongs_to :plan
  belongs_to :periodicity

  validates :plan_price, presence: true
end
