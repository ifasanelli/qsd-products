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
end
