require 'rails_helper'

feature 'User view product types' do
  scenario 'view a list with all product types' do
    create(:product_type, name: 'Hospedagem', product_key: 'HOSP')
    create(:product_type, name: 'Email', product_key: 'EMAIL')

    visit root_path
    click_on 'Tipos de Produtos'

    expect(page).to have_link('Hospedagem')
    expect(page).to have_link('Email')
  end
  xscenario 'have no one product type' do
    visit root_path
    click_on 'Tipos de Produtos'

    expect(page).to have_content('Lista Vazia')
  end
end
