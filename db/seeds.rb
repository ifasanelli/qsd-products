product_type_hosp = ProductType.create(name: 'Hospedagem', product_key: 'HOSP',
                                  description: 'Serviço - hospedagem')
product_type_email = ProductType.create(name: 'Email', product_key: 'MAIL',
                    description: 'Serviço - e-mail')
product_type_emkt = ProductType.create(name: 'Email Marketing', 
                                       product_key: 'EMKT', 
                                       description: 'Serviço - email marketing')

monthly_periodicity = Periodicity.create(name: "Mensal", period: 1 )
bimonthly_periodicity = Periodicity.create(name: "Bimestral", period: 2 )
semiannual_periodicity = Periodicity.create(name: "Semestral", period: 6 )
annual_periodicity = Periodicity.create(name: "Anual", period: 12 )


plan_l = Plan.create(name: 'Linux', description: 'Hospedagem Linux',
            product_type: product_type_hosp, details: '10 sites')

plan_w = Plan.create(name: 'Windows', description: 'Hospedagem Windows',
            product_type: product_type_hosp, details: '10 sites')
    
plan_e = Plan.create(name: 'PostFix', description: 'Email',
            product_type: product_type_email, details: '1 email')

plan_m = Plan.create(name: 'LocaMarketing', 
                     description: 'Software de email marketing',
                     product_type: product_type_emkt, details: 'envio 10/h')



Price.create(plan_price: 4356.87, plan: plan_l,
              periodicity: monthly_periodicity)

Price.create(plan_price: 5351.09, plan: plan_w,
              periodicity: bimonthly_periodicity)

Price.create(plan_price: 6129.13, plan: plan_e,
              periodicity: semiannual_periodicity)

Price.create(plan_price: 6129.13, plan: plan_m,
             periodicity: annual_periodicity)
