require 'rails_helper'

feature 'user register a new price' do
  xscenario 'succesfully' do
    create(:plan, name: 'Hospedagem Básica')
    create(:periodicity, name: 'Mensal')

    visit root_path
    click_on 'Preços'
    click_on 'Cadastrar Preço'
    select 'Hospedagem Básica', from: 'Plano'
    select 'Mensal', from: 'Periodicidade'
    click_on 'Registrar novo Preço'
    fill_in 'Preço do Plano', with: 132.72
    select 'Hospedagem Básica', from: 'Plano'
    select 'Mensal', from: 'Periodicidade'
    click_on 'Criar Preço'

    expect(page).to have_content('Preço registrado com sucesso')
  end
end
