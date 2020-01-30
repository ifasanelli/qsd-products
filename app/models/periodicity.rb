class Periodicity < ApplicationRecord
  validates :name, presence: true
  validates :period, presence: true
end
