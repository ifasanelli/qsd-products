require 'rails_helper'

feature 'User view plans' do
  scenario 'view a list with all plans' do
    product_type = create(:product_type)
    create(:plan, name: 'Hospedagem Básica', product_type: product_type)
    create(:plan, name: 'Hospedagem Profissional', product_type: product_type)
    create(:plan, name: 'Hospedagem Elite', product_type: product_type)

    visit root_path
    click_on 'Planos'

    expect(page).to have_link('Hospedagem Básica')
    expect(page).to have_link('Hospedagem Profissional')
    expect(page).to have_link('Hospedagem Elite')
    expect(current_path).not_to eq(root_path)
    expect(page).not_to have_content('Lista Vazia')
  end

  scenario 'and see none plan' do
    visit root_path
    click_on 'Planos'

    expect(page).to have_content('Lista Vazia')
  end

  scenario 'and view a plan details' do
    product_type = create(:product_type, name: 'Hospedagem')
    create(:plan, name: 'Hospedagem Básica', product_type: product_type,
                  description: 'Hospedagem de sites do tipo econômica.',
                  details: 'Detalhes referentes a Hospedagem Básica.')

    visit root_path
    click_on 'Planos'

    expect(page).to have_content('Hospedagem Básica')
    expect(page).to have_link('Hospedagem')
    expect(page).to have_content('Hospedagem de sites do tipo econômica.')
    expect(page).to have_content('Detalhes referentes a Hospedagem Básica.')
  end
end
