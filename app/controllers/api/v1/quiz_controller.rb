class Api::V1::QuizController < ApplicationController

    acts_as_token_authentication_handler_for User, only: [:logout, :create, :delete, :update]

    def index
        quiz = Quiz.all
        render json: quiz, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        quiz = Quiz.find(params[:id])
        render json: quiz, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        quiz = Quiz.create!(quiz_params)
        quiz.save!
        render json: quiz, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    
    def update
        quiz = Quiz.find(params[:id])
        quiz.update!(quiz_params)
        render json: quiz, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        quiz = Quiz.find(params[:id])
        quiz.destroy!
        render json: {message: "Prova deletada com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private
    def quiz_params 
        params.require(:quiz).permit(:title, :subject, :user_id, :team_id)
    end
end
