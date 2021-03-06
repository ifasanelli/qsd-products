class Price < ApplicationRecord
  belongs_to :plan
  belongs_to :periodicity

  validates :plan_price, numericality: true
  validates :plan_price, :plan, :periodicity, presence: true

  def as_json(options = {})
    super({
      except: :periodicity_id
    }.merge(options)).merge(periodicity: periodicity.name)
  end
end
