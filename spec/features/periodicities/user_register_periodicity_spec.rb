require 'rails_helper'

describe 'User register periodicity' do
  context 'periodicity' do
    it 'successfully' do
      visit root_path
      click_on 'Periodicidade'
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
      expect(page).to have_content('não pode ficar em branco')
    end

    it 'must be unique' do
      create(:periodicity, name: 'Anual', period: '12')
      visit root_path
      click_on 'Periodicidade'
      fill_in 'Nome', with: 'Anual'
      fill_in 'Período', with: 12
      click_on 'Salvar'
      expect(page).to have_content('já está em uso')
    end
  end
end
