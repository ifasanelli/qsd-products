require 'rails_helper'

describe 'Plan view' do
  context 'index' do
    it 'renders a json successfully' do
      product_type = create(:product_type, name: 'Plan_product_test',
                                           product_key: 'HOSP')

      first_plan = create(:plan, name: 'Basic', product_type: product_type)
      second_plan = create(:plan, name: 'Pro', product_type: product_type)

      get api_v1_plans_path

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(first_plan.name)
      expect(json[0][:description]).to eq(first_plan.description)
      expect(json[0][:details]).to eq(first_plan.details)
      expect(json[0][:product_type_id]).to eq(product_type.id)

      expect(json[1][:name]).to eq(second_plan.name)
      expect(json[1][:description]).to eq(second_plan.description)
      expect(json[1][:details]).to eq(second_plan.details)
      expect(json[1][:product_type_id]).to eq(product_type.id)
    end
  end
end
