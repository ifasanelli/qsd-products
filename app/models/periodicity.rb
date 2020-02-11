class Periodicity < ApplicationRecord
  validates :name, :period, presence: true, uniqueness: true
end
