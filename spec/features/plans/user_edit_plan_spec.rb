require 'rails_helper'

feature 'user edit a plan' do
  scenario 'successfully' do
    create(:product_type, name: 'Email1', product_key: 'EMAIL')
    create(:plan, name: 'Hospedagem Básica')

    visit root_path
    click_on 'Planos'
    click_on 'Alterar'
    fill_in 'Nome', with: 'Locamail 25'
    fill_in 'Descrição', with: 'Serviço de Email'
    select 'Email1', from: 'Tipo de Produto'
    fill_in 'Detalhes', with: 'Muitos detalhes, cheio deles'
    click_on 'Salvar'

    expect(page).to have_content('Plano editado com sucesso')
    expect(page).to have_content('Locamail 25')
    expect(page).to have_content('Serviço de Email')
    expect(page).to have_link('Email1')
    expect(page).not_to have_content('Hospedagem Básica')
    expect(page).not_to have_link('Hospedagem')
    expect(page).not_to have_content('HOSP')
  end
  scenario 'failed - cant be blank' do
    create(:plan, name: 'Hospedagem Básica')

    visit root_path
    click_on 'Planos'
    click_on 'Alterar'
    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Detalhes', with: ''
    click_on 'Salvar'

    expect(page).to have_content('não pode ficar em branco')
  end
end
