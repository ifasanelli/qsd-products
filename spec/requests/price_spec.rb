require 'rails_helper'

describe 'Price Management' do
  context 'show' do
    it 'renders a json with prices from a plan successfully' do
      plan = build(:plan)
      monthly = build(:periodicity, name: 'Mensal', period: 1)
      quarterly = build(:periodicity, name: 'Trimestral', period: 3)
      semiannual = build(:periodicity, name: 'Semestral', period: 6)
      monthly_price = create(:price, plan_price: 150.32, plan: plan,
                                     periodicity: monthly)
      quarterly_price = create(:price, plan_price: 350.34, plan: plan,
                                       periodicity: quarterly)
      semiannual_price = create(:price, plan_price: 530.56, plan: plan,
                                        periodicity: semiannual)

      get "/api/v1/plans/#{plan.id}/prices"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:periodicity_id]).to eq(monthly_price.periodicity.id)
      expect(json[0][:plan_id]).to eq(monthly_price.plan.id)
      expect(json[0][:plan_price]).to eq(monthly_price.plan_price.to_s)
      expect(json[1][:periodicity_id]).to eq(quarterly_price.periodicity.id)
      expect(json[1][:plan_id]).to eq(quarterly_price.plan.id)
      expect(json[1][:plan_price]).to eq(quarterly_price.plan_price.to_s)
      expect(json[2][:periodicity_id]).to eq(semiannual_price.periodicity.id)
      expect(json[2][:plan_id]).to eq(semiannual_price.plan.id)
      expect(json[2][:plan_price]).to eq(semiannual_price.plan_price.to_s)
      expect(response).not_to have_http_status(:not_found)
    end

    it 'renders a blank prices from a plan json successfully' do
      plan = create(:plan)

      get "/api/v1/plans/#{plan.id}/prices"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json).to eq([])
      expect(response).not_to have_http_status(:not_found)
    end

    it 'renders a not found status if a plan is unavailable' do
      plan = build(:plan, status: :unavailable)
      monthly = build(:periodicity, name: 'Mensal', period: 1)
      quarterly = build(:periodicity, name: 'Trimestral', period: 3)
      semiannual = build(:periodicity, name: 'Semestral', period: 6)
      monthly_price = create(:price, plan_price: 150.32, plan: plan,
                                     periodicity: monthly)
      quarterly_price = create(:price, plan_price: 350.34, plan: plan,
                                       periodicity: quarterly)
      semiannual_price = create(:price, plan_price: 530.56, plan: plan,
                                        periodicity: semiannual)

      get "/api/v1/plans/#{plan.id}/prices"

      expect(response).to have_http_status(:not_found)
      expect(response).not_to have_http_status(:ok)
    end

    it 'renders a not found status from a id that doesn\'t exist' do
      get '/api/v1/plans/999_999/prices'

      expect(response).to have_http_status(:not_found)
      expect(response).not_to have_http_status(:ok)
    end
  end
end
