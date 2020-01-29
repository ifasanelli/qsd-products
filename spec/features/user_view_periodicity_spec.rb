require 'rails_helper'

describe 'User view periodicity' do
  context 'periodicity' do 
    it 'successfully' do
      periodicity_one_month = create(:periodicity, period: 1)
      periodicity_three_months = create(:periodicity, period: 3)
      periodicity_six_months = create(:periodicity, period: 6)
      periodicity_twelve_months = create(:periodicity, period: 12)
     
      visit root_path
      click_on 'Periodicidade'
      
      expect(page).to have_content('Meses')
      expect(page).to have_content('1')
      expect(page).to have_content('3')
      expect(page).to have_content('6')
      expect(page).to have_content('12')
    end
    it 'dont have periodicity registered'do
      visit root_path
      click_on 'Periodicidade'

      expect(page).to have_content('Não há periodicidades cadastradas')
    end
  end
  
end