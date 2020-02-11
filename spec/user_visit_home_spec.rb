require 'rails_helper'

feature 'user visit home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Gestão de Produtos')
    expect(page).to have_content('Bem vindo a Gestão de Produtos')
    expect(current_path).to eq(root_path)
  end
end
