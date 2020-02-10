# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ProductType.create!(name: 'TESTHOSPTEST41', product_key: 'TST41', 
                    description: 'Descrição do TESTHOSPTEST41')
ProductType.create!(name: 'TESTHOSPTEST432', product_key: 'TS432', 
                    description: 'Descrição do TESTHOSPTEST432')
ProductType.create!(name: 'TESTHOSPTEST122', product_key: 'TS122', 
                    description: 'Descrição do TESTHOSPTEST122')
Plan.create(name: 'Basic', description: 'Plano Básico',
            product_type: ProductType.find_by_id(1),
            details: 'Plano básico contendo [x,y,z]')

Plan.create(name: 'Pro', description: 'Plano Profissional',
            product_type: ProductType.find_by_id(1),
            details: 'Plano Profissional contendo [x,y,z,a,b]')
# Periodicity.create(name: "Mensal", period: 1 )
# Periodicity.create(name: "Trimestral", period: 3 )
# Periodicity.create(name: "Semestral", period: 6 )
