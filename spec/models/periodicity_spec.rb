require 'rails_helper'

describe Periodicity do
  describe '#presence' do
    it 'validates every field must be filled' do
      periodicity = Periodicity.new(name: nil, period: nil)
      periodicity.valid?

      expect(periodicity.errors.full_messages).to include(
        'Nome não pode ficar em branco',
        'Período não pode ficar em branco'
      )
    end
  end

  describe '#uniqueness' do
    it 'validates name and period must be unique' do
      create(:periodicity, name: 'Mensal', period: 1)
      periodicity = Periodicity.new(name: 'Mensal', period: 1)
      periodicity.valid?

      expect(periodicity.errors.full_messages).to include(
        'Nome já está em uso',
        'Período já está em uso'
      )
    end
  end
end
