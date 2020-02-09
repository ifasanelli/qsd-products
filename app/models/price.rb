class Price < ApplicationRecord
  belongs_to :plan
  belongs_to :periodicity
  validates :plan_price, :plan_id, :periodicity_id, presence: true
end
