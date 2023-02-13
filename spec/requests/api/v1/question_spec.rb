require 'rails_helper'

RSpec.describe 'Api::V1::Questions', type: :request do
  describe '/GET #index' do
    it 'return http status OK' do
      get '/api/v1/question/index'
      expect(response).to have_http_status(:ok)
    end
    it 'returns a JSON' do
      get '/api/v1/question/index'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
  describe '/GET #show' do
    it 'if question exist' do
      question = create(:question)
      get "/api/v1/question/show/#{question.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'if question not exist' do
      get '/api/v1/question/show/-1'
      expect(response).to have_http_status(:not_found)
    end
  end
  describe '/GET #create' do
    let(:user) { create(:user) }
    let(:question_params) do
      { title: 'teste', description: 'teste', subject: 'teste', answer: 'teste', user_id: user.id }
    end
    context 'with ok params' do
      it 'return http status created' do
        post '/api/v1/question/create', params: { question: question_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    context 'with bad params' do
      it 'returns http status bad request' do
        question_params = nil
        post '/api/v1/user/create', params: { contact: question_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:question_params) do
      { title: 'teste', description: 'teste', subject: 'teste', answer: 'teste', user_id: user.id }
    end
    let(:question) { create(:question, answer: 'teste2') }
    context 'with ok params' do
      it 'return http status ok' do
        patch "/api/v1/question/update/#{question.id}", params: { question: question_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'with bad params' do
      it 'returns http status bad request' do
        question_params = nil
        patch '/api/v1/question/update/54', params: { question: question_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe '/DELETE #delete' do
    let(:user) { create(:user) }
    let(:question) { create(:question) }
    context 'when question exist' do
      it 'return http status ok' do
        delete "/api/v1/question/delete/#{question.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'when question not exist' do
      it 'return bad request' do
        delete '/api/v1/question/delete/999', headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
