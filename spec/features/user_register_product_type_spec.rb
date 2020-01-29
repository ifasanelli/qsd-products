require 'rails_helper'

feature 'user register a new product type' do
  scenario 'succesfully' do
    visit root_path

    click_on 'Tipos de Produtos'
    click_on 'Registrar novo Tipo de Produto'
    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição', with: 'É um espaço em servidor fornecido pela Locaweb'\
                               ' para que você possa armazenar o seu site.'
    fill_in 'Chave do Produto', with: 'HOSP'
    click_on 'Enviar'

    expect(page).to have_content('Tipo de Produto registrado com sucesso')
    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('É um espaço em servidor fornecido')
    expect(page).to have_content('HOSP')
    expect(current_path).not_to eq(root_path)
  end
end