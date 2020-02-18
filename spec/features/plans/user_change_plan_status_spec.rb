require 'rails_helper'

feature 'Admin change a plan status' do
  scenario 'from available to unavailable by clicking on actual status' do
    plan = create(:plan)
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Planos'
    click_on 'Alterar status'

    expect(plan.reload).to be_unavailable
    expect(page).to have_content('Indisponível')
    expect(plan.reload).not_to be_available
    expect(page).not_to have_content('Disponível')
  end

  scenario 'from unavailable to available by clicking on actual status' do
    plan = create(:plan, status: :unavailable)
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Planos'
    click_on 'Alterar status'

    expect(plan.reload).to be_available
    expect(page).to have_content('Disponível')
    expect(plan.reload).not_to be_unavailable
    expect(page).not_to have_content('Indisponível')
  end
end
