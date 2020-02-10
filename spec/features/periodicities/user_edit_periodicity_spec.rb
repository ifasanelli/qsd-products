require 'rails_helper'

describe 'User edit periodicity' do
  context 'periodicity' do
    it 'fill form with data' do
      create(:periodicity, name: 'X', period: 33)
      user = create(:user)

      login_as user, scope: :user
      visit root_path
      click_on 'Periodicidade'
      click_on 'Alterar'

      expect(page).to have_field('Nome', with: 'X')
      expect(page).to have_field('Período', with: 33)
    end
    it 'successfully' do
      create(:periodicity, name: 'X', period: 33)
      user = create(:user)

      login_as user, scope: :user
      visit root_path
      click_on 'Periodicidade'
      click_on 'Alterar'
      fill_in 'Nome', with: 'Anual'
      fill_in 'Período', with: 12
      click_on 'Salvar'

      expect(page).to have_content('Anual')
      expect(page).to have_content('12')
    end

    it 'fields cant be blank' do
      create(:periodicity, name: 'X', period: 33)
      user = create(:user)

      login_as user, scope: :user
      visit root_path
      click_on 'Periodicidade'
      click_on 'Alterar'
      fill_in 'Nome', with: ''
      fill_in 'Período', with: ''
      click_on 'Salvar'
      expect(page).to have_content('não pode ficar em branco')
    end

    it 'must be unique' do
      create(:periodicity, name: 'Anual', period: '12')
      user = create(:user)

      login_as user, scope: :user
      visit root_path
      click_on 'Periodicidade'
      fill_in 'Nome', with: 'Anual'
      fill_in 'Período', with: 12
      click_on 'Salvar'

      expect(page).to have_content('já está em uso')
    end
  end
end
