require 'rails_helper'

describe ProductType do
  describe '#presence' do
    it 'validates every field must be filled' do
      product_type = ProductType.new(name: nil, description: nil,
                                     product_key: nil)
      product_type.valid?

      expect(product_type.errors.full_messages).to include(
        'Nome não pode ficar em branco',
        'Descrição não pode ficar em branco',
        'Chave do Produto não pode ficar em branco'
      )
    end
  end

  describe '#uniqueness' do
    it 'validates name and product key must be unique' do
      create(:product_type, name: 'Hospedagem', product_key: 'HOSP')
      product_type = ProductType.new(name: 'Hospedagem', product_key: 'HOSP')
      product_type.valid?

      expect(product_type.errors.full_messages).to include(
        'Nome já está em uso',
        'Chave do Produto já está em uso'
      )
    end
  end

  describe '#length' do
    it 'validates product key must have 5 caracters' do
      product_type = ProductType.new(product_key: 'HOSPED')
      product_type.valid?

      expect(product_type.errors.full_messages).to include(
        'Chave do Produto é muito longo (máximo: 5 caracteres)'
      )
    end
  end
end
