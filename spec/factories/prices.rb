FactoryBot.define do
  factory :price do
    plan_price { "9.99" }
    plan { nil }
    periodicity { nil }
  end
end
