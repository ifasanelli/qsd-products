require 'rails_helper'

feature 'user view price' do
  scenario 'succesfully' do
    plan = create(:plan)
    periodicity = create(:periodicity)
    create(:price, plan_price: '19.00', plan_id: plan.id,
                   periodicity_id: periodicity.id)
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Preços'

    expect(page).to have_content '19.0'
  end
  it 'dont have prices registered' do
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Preços'
    expect(page).to have_content('Lista Vazia')
  end
end
