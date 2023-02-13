require 'rails_helper'

RSpec.describe 'Api::V1::Statistics', type: :request do
  describe '/GET #index' do
    it 'return http status OK' do
      get '/api/v1/statistic/index'
      expect(response).to have_http_status(:ok)
    end
    it 'returns a JSON' do
      get '/api/v1/statistic/index'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
  describe '/GET #show' do
    it 'if statistic exist' do
      statistic = create(:statistic)
      get "/api/v1/statistic/show/#{statistic.id}"
      expect(response).to have_http_status(:ok)
    end
    it 'if statistic not exist' do
      get '/api/v1/statistic/show/-1'
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:statistic_params) do
      { questions_answered: 5, right_answers: 3, wrong_answers: 2 }
    end
    let(:statistic) { create(:statistic, right_answers: 4, wrong_answers: 1) }
    context 'with ok params' do
      it 'return http status ok' do
        patch "/api/v1/statistic/update/#{statistic.id}", params: { statistic: statistic_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'with bad params' do
      it 'returns http status bad request' do
        statistic_params = nil
        patch '/api/v1/statistic/update/54', params: { statistic: statistic_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
