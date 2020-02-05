# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Periodicity.create(name: "Mensal", period: 1 )
# Periodicity.create(name: "Trimestral", period: 3 )
# Periodicity.create(name: "Semestral", period: 6 )
product_type = ProductType.create(name: 'Plan_product_test', description: 'teste',
                                  product_key: 'XYZ')

Plan.create(name: 'Plan Mensal', description:'desc teste', product_type: product_type, details: 'detalhes')
Plan.create(name: 'Plan Anual', description:'desc teste', product_type: product_type, details: 'detalhes')
