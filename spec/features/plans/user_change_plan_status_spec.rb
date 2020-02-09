require 'rails_helper'

feature 'Admin change a plan status' do
  scenario 'from available to unavailable by clicking on actual status' do
    plan = create(:plan)

    visit root_path
    click_on 'Planos'
    click_on 'Disponível'

    expect(plan.reload).to be_unavailable
    expect(page).to have_link('Indisponível')
    expect(plan.reload).not_to be_available
    expect(page).not_to have_link('Disponível')
  end

  scenario 'from unavailable to available by clicking on actual status' do
    plan = create(:plan, status: :unavailable)

    visit root_path
    click_on 'Planos'
    click_on 'Indisponível'

    expect(plan.reload).to be_available
    expect(page).to have_link('Disponível')
    expect(plan.reload).not_to be_unavailable
    expect(page).not_to have_link('Indisponível')
  end
end
