require 'rails_helper'

describe 'User edit periodicity' do
  context 'periodicity' do
    it 'fill form with data' do
      create(:periodicity, name: 'X', period: 33)

      visit root_path
      click_on 'Periodicidade'
      click_on 'Alterar'

      expect(page).to have_field('Nome', with: 'X')
      expect(page).to have_field('Período', with: 33 )
    end
    it 'successfully' do
      create(:periodicity, name: 'X', period: 33)

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
      visit root_path
      click_on 'Periodicidade'
      click_on 'Salvar'
      expect(page).to have_content("Name can't be blank")
    end
    it 'must be unique' do
      create(:periodicity, name: 'Anual', period: '12')

      visit root_path
      click_on 'Periodicidade'
      fill_in 'Nome', with: 'Anual'
      fill_in 'Período', with: 12
      click_on 'Salvar'

      expect(page).to have_content("has already been taken")
    end
  end
end