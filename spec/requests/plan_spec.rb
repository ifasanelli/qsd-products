require 'rails_helper'

describe 'Plan Management' do
  context 'index' do
    it 'renders a json successfully' do
      plan = create(:plan, name: 'Hospedagem XPto', description: 'etc',
                           details: '123')

      get api_v1_plan_path(plan)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:name]).to eq(plan.name)
      expect(json[:description]).to eq(plan.description)
      expect(json[:details]).to eq(plan.details)
      expect(json[:product_type_id]).to eq(plan.product_type_id)
    end
    it 'renders a json failed - car not exists' do
      get api_v1_plan_path(100)
      expect(response).to have_http_status(404)
    end
  end
end
