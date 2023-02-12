require 'rails_helper'

RSpec.describe 'Api::V1::Quizzes', type: :request do
  describe '/GET #index' do
    it 'return http status OK' do
      get '/api/v1/quiz/index'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON' do
      get '/api/v1/quiz/index'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe '/GET #show' do
    it 'if quiz exist' do
      quiz = create(:quiz)
      get "/api/v1/quiz/show/#{quiz.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'if quiz not exist' do
      get '/api/v1/quiz/show/-1'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '/GET #create' do
    let(:user) { create(:user) }
    let(:team) { create(:team) }
    let(:quiz_params) do
      { title: 'teste', subject: 'teste', user_id: user.id, team_id: team.id }
    end

    context 'with ok params' do
      it 'return http status created' do
        post '/api/v1/quiz/create', params: { quiz: quiz_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with bad params' do
      it 'returns http status bad request' do
        quiz_params = nil
        post '/api/v1/user/create', params: { contact: quiz_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:team) { create(:team) }
    let(:quiz_params) do
      { title: 'teste', subject: 'teste', user_id: user.id, team_id: team.id }
    end
    let(:quiz) { create(:quiz, subject: 'teste2') }

    context 'with ok params' do
      it 'return http status ok' do
        patch "/api/v1/quiz/update/#{quiz.id}", params: { quiz: quiz_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with bad params' do
      it 'returns http status bad request' do
        quiz_params = nil
        patch '/api/v1/quiz/update/54', params: { quiz: quiz_params }, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '/DELETE #delete' do
    let(:user) { create(:user) }
    let(:quiz) { create(:quiz) }

    context 'when quiz exist' do
      it 'return http status ok' do
        delete "/api/v1/quiz/delete/#{quiz.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when quiz not exist' do
      it 'return bad request' do
        delete '/api/v1/quiz/delete/999', headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
