require 'rails_helper'

feature 'User view product types' do
  scenario 'view a list with all product types' do
    create(:product_type, name: 'Hospedagem', product_key: 'HOSP')
    create(:product_type, name: 'Email', product_key: 'EMAIL')

    visit root_path
    click_on 'Tipos de Produtos'

    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('Email')
    expect(current_path).not_to eq(root_path)
    expect(page).not_to have_content('Lista Vazia')
  end

  scenario 'and see none product_type' do
    visit root_path
    click_on 'Tipos de Produtos'

    expect(page).to have_content('Lista Vazia')
  end

  scenario 'and view a product type details' do
    create(:product_type, description: 'Hospedagem de sites',
                          name: 'Hospedagem', product_key: 'HOSP')

    visit root_path
    click_on 'Tipos de Produtos'

    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('Hospedagem de sites')
    expect(page).to have_content('HOSP')
  end
end
