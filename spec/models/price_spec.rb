require 'rails_helper'

RSpec.describe Price, type: :model do
  describe 'validates#plan_price' do
    it 'verify presence' do
      price = Price.new

      price.valid?

      expect(price.errors.full_messages).to include('Preço do Plano não pode '\
                                                   'ficar em branco')
    end

    it 'verify if plan price is a number' do
      price = Price.new(plan_price: 'PREÇO')

      price.valid?

      expect(price.errors.full_messages).to include('Preço do Plano não é um'\
                                                    ' número')
    end
  end
end
