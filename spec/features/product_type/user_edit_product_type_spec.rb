require 'rails_helper'

feature 'user edit a product type' do
  scenario 'successfully' do
    create(:product_type, name: 'Hospedagem')

    visit root_path
    click_on 'Tipos de Produtos'
    click_on 'Alterar'
    fill_in 'Nome', with: 'Email'
    fill_in 'Descrição', with: 'Serviço de email usa protocolos pop/smtp'
    fill_in 'Chave do Produto', with: 'EMAIL'
    click_on 'Salvar'

    expect(page).to have_content('Tipo de Produto editado com sucesso')
    expect(page).to have_content('Email')
    expect(page).to have_content('Serviço de email usa protocolos pop/smtp')
    expect(page).to have_content('EMAIL')
  end

  scenario 'return error message if can\'t edit' do
    create(:product_type, name: 'Hospedagem')

    visit root_path
    click_on 'Tipos de Produtos'
    click_on 'Alterar'
    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Chave do Produto', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os seguintes erros')
  end
end
