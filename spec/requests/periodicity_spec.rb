require 'rails_helper'

describe 'Periodicity view api' do
  context 'index' do
    it 'renders a json successfully - list' do
      monthly = Periodicity.create(name: 'Semestral', period: 1)
      bimonthly = Periodicity.create(name: 'Bimestral', period: 2)
      semi_annual = Periodicity.create(name: 'Anual', period: 6)
      get api_v1_periodicities_path
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(monthly.name)
      expect(json[0][:period]).to eq(monthly.period)
      expect(json[1][:name]).to eq(bimonthly.name)
      expect(json[1][:period]).to eq(bimonthly.period)
      expect(json[2][:name]).to eq(semi_annual.name)
      expect(json[2][:period]).to eq(semi_annual.period)
    end

    it 'renders a blank json successfully' do
      get api_v1_periodicities_path
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(json).to eq([])
      expect(response).not_to have_http_status(:bad_request)
    end
  end
end
