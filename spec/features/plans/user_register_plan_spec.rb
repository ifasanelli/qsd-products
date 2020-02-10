require 'rails_helper'

feature 'user register a new plan' do
  scenario 'succesfully' do
    create(:product_type, name: 'Hospedagem')

    visit root_path
    click_on 'Planos'
    fill_in 'Nome', with: 'Hospedagem Básica'
    fill_in 'Descrição', with: 'É um espaço em servidor fornecido pela Locaweb'\
                               ' para que você possa armazenar o seu site.'
    select 'Hospedagem', from: 'Tipo de Produto'
    fill_in 'Detalhes', with: 'Muitos detalhes, cheio deles'
    click_on 'Salvar'

    expect(page).to have_content('Plano registrado com sucesso')
    expect(page).to have_content('Hospedagem Básica')
    expect(page).to have_content('É um espaço em servidor fornecido')
    expect(page).to have_link('Hospedagem')
    expect(page).to have_content('Muitos detalhes, cheio deles')
    expect(current_path).not_to eq(root_path)
  end

  scenario 'return error message if can\'t register' do
    visit root_path

    click_on 'Planos'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os seguintes erros')
    expect(page).not_to have_content('Hospedagem Básica')
  end
end
