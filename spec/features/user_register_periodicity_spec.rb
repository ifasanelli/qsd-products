require 'rails_helper'

describe 'User register periodicity' do
  context 'periodicity' do 
    it 'successfully' do
      visit root_path
      click_on 'Periodicidade'
      fill_in 'Campo_nome', with: 'Anual'
      fill_in 'Campo_periodo', with: 12
      click_on 'Salvar'
      
      expect(page).to have_content('Anual')
      expect(page).to have_content('12')
    end
    xit 'dont have periodicity registered'do
      
    end
  end
  
end