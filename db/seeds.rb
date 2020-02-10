# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = ProductType.create!(name: 'Hospedagem', product_key: 'HOSP',
                              description: 'É um espaço em servidor fornecido '\
                                           'pela Locaweb para que você possa '\
                                           'armazenar o seu site e todas as '\
                                           'informações, vídeos, fotos e '\
                                           'textos referentes a ele')
other_product = ProductType.create!(name: 'Email', product_key: 'EMAIL',
                                    description: 'É um serviço de correio '\
                                                 'eletrônico para envios e '\
                                                 'recebimentos de mensagens, '\
                                                 'que pode ser personalizado a'\
                                                 ' partir da contratação de um'\
                                                 ' serviço de e-mail '\
                                                 'profissional.')
another_product = ProductType.create!(description: 'É uma ferramenta completa '\
                                                   'que vai te ajudar a '\
                                                   'melhorar a divulgação do '\
                                                   'seu negócio e se '\
                                                   'relacionar com o seu '\
                                                   'público.',
                                      name: 'Email Marketing',
                                      product_key: 'EMKT',)

plan = Plan.create!(name: 'Hospedagem I', description: 'Serviço de Hospedagem',
                    product_type: product, details: 'Sites ilimitados, '\
                                                    '25 e-mails(10 GB cada), '\
                                                    '1 ano de SSL grátis, 1 '\
                                                    'ano de domínio grátis.')
other_plan = Plan.create!(name: 'Initial 25', description: 'Serviço de Email',
                          product_type: other_product,
                          details: '25 caixas postais, 15 GB de espaço por '\
                                   'caixa, a partir de R$ 1,05 por caixa')
another_plan = Plan.create!(name: 'Email Marketing Start',
                            description: 'Serviço de Email Marketing',
                            product_type: another_product,
                            details: '25 caixas postais, 15 GB de espaço por '\
                                     'caixa, a partir de R$ 1,05 por caixa')

periodicity = Periodicity.create!(name: "Mensal", period: 1 )
other_periodicity = Periodicity.create!(name: "Trimestral", period: 3 )
another_periodicity = Periodicity.create!(name: "Anual", period: 12)

Price.create(plan_price: 190.80, plan: plan, periodicity: another_periodicity)
Price.create(plan_price: 29.60, plan: other_plan, periodicity: periodicity)
Price.create(plan_price: 33.16, plan: another_plan,
             periodicity: other_periodicity)
