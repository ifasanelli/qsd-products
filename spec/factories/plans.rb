FactoryBot.define do
  factory :plan do
    name { 'MyString' }
    description { 'MyText' }
    product_type
    details { 'MyText' }
    status { :available }
  end
end
