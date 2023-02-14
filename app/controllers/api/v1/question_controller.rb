module Api
  module V1
    class QuestionController < ApplicationController

      def index
        question = Question.all
        render json: question, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      def show
        question = Question.find(params[:id])
        render json: question, status: :ok
      rescue StandardError
        head(:not_found)
      end

      def create
        question = Question.create!(question_params)
        question.save!
        render json: question, status: :created
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      def update
        question = Question.find(params[:id])
        question.update!(question_params)
        render json: question, status: :ok
      rescue StandardError => e
        render json: e, status: :unprocessable_entity
      end

      def delete
        question = Question.find(params[:id])
        question.destroy!
        render json: { message: 'Prova deletada com sucesso' }, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      private

      def question_params
        params.require(:question).permit(:title, :description, :subject, :answer, :user_id)
      end
    end
  end
end
