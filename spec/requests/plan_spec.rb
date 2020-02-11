require 'rails_helper'

describe 'Plan view api' do
  context 'index' do
    it 'renders a json successfully' do
      product_type = create(:product_type)

      basic_plan = Plan.create(name: 'Small', description: 'Plano basico',
                               product_type: product_type,
                               details: 'Plano básico contendo [x,y,z]')

      pro_plan = Plan.create(name: 'Pro', description: 'Plano Profissional',
                             product_type: product_type,
                             details: 'Plano Profissional contendo [x,y,z,a,b]')
      get api_v1_plans_path
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(basic_plan.name)
      expect(json[0][:description]).to eq(basic_plan.description)
      expect(json[0][:details]).to eq(basic_plan.details)
      expect(json[1][:name]).to eq(pro_plan.name)
      expect(json[1][:description]).to eq(pro_plan.description)
      expect(json[1][:details]).to eq(pro_plan.details)
    end

    it 'renders a blank json successfully' do
      get api_v1_plans_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json).to eq([])
      expect(response).not_to have_http_status(:bad_request)
    end
  end
end
