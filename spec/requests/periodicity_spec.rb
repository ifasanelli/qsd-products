require 'rails_helper'

describe 'Periodicity view api' do
  context 'index' do
    it 'renders a json successfully' do
      periodicity = Periodicity.create(name: 'Semestral', period: 6)

      get api_v1_periodicities_path

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[0][:name]).to eq(periodicity.name)
      expect(json[0][:period]).to eq(periodicity.period)
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
