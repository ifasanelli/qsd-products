require 'rails_helper'

describe Plan do
  describe '#presence' do
    it 'validates every field must be filled' do
      plan = Plan.new(name: nil, product_type: nil, details: nil,
                      description: nil)
      plan.valid?

      expect(plan.errors.full_messages).to include(
        'Nome não pode ficar em branco',
        'Tipo de Produto é obrigatório(a)',
        'Detalhes não pode ficar em branco',
        'Descrição não pode ficar em branco'
      )
    end
  end

  describe '#uniqueness' do
    it 'validates name must be unique' do
      create(:plan, name: 'Hospedagem Básica')
      plan = Plan.new(name: 'Hospedagem Básica')
      plan.valid?

      expect(plan.errors.full_messages).to include('Nome já está em uso')
    end
  end
end
