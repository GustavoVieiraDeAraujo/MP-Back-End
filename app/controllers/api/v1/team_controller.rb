module Api
  module V1
    class TeamController < ApplicationController
      acts_as_token_authentication_handler_for User, only: %i[delete update]

      def index
        team = Team.all
        render json: team, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      def show
        team = Team.find(params[:id])
        render json: team, status: :ok
      rescue StandardError => e
        render json: e, status: :not_found
      end

      def create
        team = Team.create!(team_params)
        team.save!
        render json: team, status: :created
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      def update
        team = Team.find(params[:id])
        team.update!(team_params)
        render json: team, status: :ok
      rescue StandardError => e
        render json: e, status: :unprocessable_entity
      end

      def delete
        team = Team.find(params[:id])
        team.destroy!
        render json: { message: "Turma #{team.name} deletada com sucesso" }, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      def add_user_to_team
        student_team = StudentTeam.new(user_id: params[:user_id], team_id: params[:team_id])
        student_team.save!
        render json: student_team, status: :created
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      def remove_user_from_team
        student_team = StudentTeam.find_by!(user_id: params[:user_id], team_id: params[:team_id])
        student_team.destroy!
        head(:ok)
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      private

      def team_params
        params.require(:team).permit(:name, :user_id)
      end
    end
  end
end
