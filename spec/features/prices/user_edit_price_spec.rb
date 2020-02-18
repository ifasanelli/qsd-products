require 'rails_helper'

feature 'User edit price' do
  scenario 'successfully' do
    create(:periodicity, name: 'Trimestral', period: 3)
    product_type = create(:product_type)
    plan = create(:plan, name: 'Hospedagem I', product_type: product_type)
    periodicity = create(:periodicity, name: 'Mensal')
    create(:price, plan: plan, periodicity: periodicity)
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Preços'
    click_on 'Alterar'
    fill_in 'Preço do Plano', with: 29.97
    select 'Trimestral', from: 'Periodicidade'
    click_on 'Salvar'

    expect(page).to have_content('Preço atualizado com sucesso')
    expect(page).to have_content(29.97)
    expect(page).to have_content('Trimestral')
  end

  scenario 'and must fill the plan price' do
    product_type = create(:product_type)
    plan = create(:plan, name: 'Hospedagem I', product_type: product_type)
    periodicity = create(:periodicity, name: 'Mensal')
    create(:price, plan: plan, periodicity: periodicity)
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Preços'
    click_on 'Alterar'
    fill_in 'Preço do Plano', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os seguintes erros')
    expect(page).to have_content('Preço do Plano não pode ficar em branco')
    expect(page).to_not have_content('Preço atualizado com sucesso')
  end
end
