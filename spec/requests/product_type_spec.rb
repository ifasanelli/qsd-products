require 'rails_helper'

describe 'Product Type Management' do
  context 'index' do
    it 'renders a json successfully' do
      product_type = create(:product_type)
      other_product_type = create(:product_type, name: 'TypeProduct_test',
                                                 product_key: 'TPTST')

      get api_v1_product_types_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(product_type.name)
      expect(json[0][:description]).to eq(product_type.description)
      expect(json[0][:product_key]).to eq(product_type.product_key)
      expect(json[1][:name]).to eq(other_product_type.name)
      expect(json[1][:description]).to eq(other_product_type.description)
      expect(json[1][:product_key]).to eq(other_product_type.product_key)
    end

    it 'renders a blank json successfully' do
      get api_v1_product_types_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json).to eq([])
      expect(response).not_to have_http_status(:bad_request)
    end
    it 'renders plans from a product' do
      product_type = create(:product_type)

      basic_plan = Plan.create(name: 'Small', description: 'Plano basico',
                               product_type: product_type,
                               details: 'Plano básico contendo [x,y,z]')

      pro_plan = Plan.create(name: 'Pro', description: 'Plano Profissional',
                             product_type: product_type,
                             details: 'Plano Profissional contendo [x,y,z,a,b]')

      get api_v1_product_type_path(product_type[:id])
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(basic_plan.name)
      expect(json[0][:description]).to eq(basic_plan.description)
      expect(json[0][:details]).to eq(basic_plan.details)
      expect(json[1][:name]).to eq(pro_plan.name)
      expect(json[1][:description]).to eq(pro_plan.description)
      expect(json[1][:details]).to eq(pro_plan.details)
    end
  end
end
