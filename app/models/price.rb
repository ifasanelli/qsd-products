class Price < ApplicationRecord
  belongs_to :plan
  belongs_to :periodicity
end
