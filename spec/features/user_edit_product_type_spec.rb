require 'rails_helper'

feature 'user edit a product type' do
  scenario 'successfully' do
    create(:product_type, name: 'Hospedagem')

    visit root_path
    click_on 'Tipos de Produtos'
    click_on 'Hospedagem'
    click_on 'Editar'
    fill_in 'Nome', with: 'Email'
    fill_in 'Descrição', with: 'Serviço de email usa protocolos pop/smtp'
    fill_in 'Chave do Produto', with: 'EMAIL'
    click_on 'Enviar'
  end
end