require 'rails_helper'

describe 'User view periodicity' do
  context 'periodicity' do
    it 'successfully' do
      create(:periodicity, name: 'Mensal', period: 1)
      create(:periodicity, name: 'Trimestral', period: 3)
      create(:periodicity, name: 'Semestral', period: 6)
      create(:periodicity, name: 'Anual', period: 12)
      visit root_path
      click_on 'Periodicidade'
      expect(page).to have_content('Meses')
      expect(page).to have_content('1')
      expect(page).to have_content('3')
      expect(page).to have_content('6')
      expect(page).to have_content('12')
    end
    it 'dont have periodicity registered' do
      visit root_path
      click_on 'Periodicidade'
      expect(page).to have_content('Lista vazia')
    end
  end
end
