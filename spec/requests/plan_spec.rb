require 'rails_helper'

describe 'Plan Management' do
  context 'index' do
    it 'renders a json successfully' do
      product_type = create(:product_type, name: 'Hospedagem',
                                           product_key: 'HOSP')
      plan = create(:plan, name: 'Hospedagem Básica',
                           product_type: product_type)
      other_plan = create(:plan, name: 'Hospedagem Profissional',
                                 product_type: product_type)

      get api_v1_plans_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(plan.name)
      expect(json[0][:product_type_id]).to eq(plan.product_type.id)
      expect(json[0][:description]).to eq(plan.description)
      expect(json[0][:details]).to eq(plan.details)
      expect(json[1][:name]).to eq(other_plan.name)
      expect(json[1][:product_type_id]).to eq(other_plan.product_type.id)
      expect(json[1][:description]).to eq(other_plan.description)
      expect(json[1][:details]).to eq(other_plan.details)
      expect(response).not_to have_http_status(:not_found)
    end

    it 'renders a blank json successfully' do
      get api_v1_plans_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json).to eq([])
      expect(response).not_to have_http_status(:not_found)
    end
  end

  context 'show' do
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
