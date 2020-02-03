class Periodicity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :period, presence: true, uniqueness: true
end
