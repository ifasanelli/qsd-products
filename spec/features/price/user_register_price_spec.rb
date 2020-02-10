require 'rails_helper'

feature 'user register a new price' do
  scenario 'succesfully' do
    create(:plan, name: 'Hospedagem Básica')
    create(:periodicity, name: 'Mensal')

    visit root_path
    click_on 'Preços'
    click_on 'Registrar novo Preço'
    select 'Hospedagem Básica', from: 'Plano'
    select 'Mensal', from: 'Periodicidade'
    fill_in 'Preço do Plano', with: 132.72
    click_on 'Salvar'

    expect(page).to have_content('Preço registrado com sucesso')
  end

  scenario 'return error message if can\'t register' do
    visit root_path

    click_on 'Preços'
    click_on 'Registrar novo Preço'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os seguintes erros')
    expect(page).not_to have_content('Preço registrado com sucesso')
  end
end
