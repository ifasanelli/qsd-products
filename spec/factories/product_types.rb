FactoryBot.define do
  factory :product_type do
    name { 'Hospedagem' }
    description do
      'É um espaço em servidor fornecido pela Locaweb para que ' \
      'você possa armazenar o seu site.'
    end
    product_key { 'HOSP' }
  end
end
