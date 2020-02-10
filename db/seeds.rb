product_type = ProductType.create(name: 'TESTHOSPTEST41', product_key: 'TST41',
                                  description: 'Descrição do TESTHOSPTEST41')
ProductType.create(name: 'TESTHOSPTEST432', product_key: 'TS432',
                    description: 'Descrição do TESTHOSPTEST432')
ProductType.create(name: 'TESTHOSPTEST122', product_key: 'TS122',
                    description: 'Descrição do TESTHOSPTEST122')

five_years_periodicity = Periodicity.create(name: "CincoAnos", period: 60 )
six_years_periodicity = Periodicity.create(name: "SeisAnos", period: 72 )
seven_years_periodicity = Periodicity.create(name: "SeteAnos", period: 84 )

plan = Plan.create(name: 'TESTHOSPTEST41 BASICO', description: 'Descrição test',
                   product_type: product_type, details: 'Detalhe detalhado')

Price.create(plan_price: 4356.87, plan: plan,
             periodicity: five_years_periodicity)
Price.create(plan_price: 5351.09, plan: plan,
             periodicity: six_years_periodicity)
Price.create(plan_price: 6129.13, plan: plan,
             periodicity: seven_years_periodicity)

Plan.create(name: 'Basic', description: 'Plano Básico',
            product_type: ProductType.find_by_id(1),
            details: 'Plano básico contendo [x,y,z]')

Plan.create(name: 'Pro', description: 'Plano Profissional',
            product_type: ProductType.find_by_id(1),
            details: 'Plano Profissional contendo [x,y,z,a,b]')

User.create(email: 'marketing@locaweb.com.br', password: 'mkt2020')
