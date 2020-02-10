require 'rails_helper'

feature 'user edit a plan' do
  xscenario 'successfully' do
    product_type = create(:product_type, name: 'Hospedagem',
                                         product_key: 'HOSP')
    create(:plan, name: 'Hospedagem Básica', product_type: product_type)
    create(:product_type, name: 'Email', product_key: 'EMAIL')
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Planos'
    click_on 'Hospedagem Básica'
    click_on 'Editar'
    fill_in 'Nome', with: 'Locamail 25'
    fill_in 'Descrição', with: 'Serviço de Email'
    select 'Email', from: 'Tipo de Produto'
    fill_in 'Detalhes', with: 'Muitos detalhes, cheio deles'
    click_on 'Atualizar Plano'

    expect(current_path).to eq(plans_path)
    expect(page).to have_content('editado com sucesso')
    expect(page).to have_content('Locamail 25')
    expect(page).to have_content('Serviço de Email')
    expect(page).to have_link('Email')
    expect(page).to have_content('EMAIL')
    expect(page).to have_content('Muitos detalhes, cheio deles')
    expect(page).not_to have_content('Hospedagem Básica')
    expect(page).not_to have_link('Hospedagem')
    expect(page).not_to have_content('HOSP')
  end
end
