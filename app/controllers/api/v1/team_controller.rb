class Api::V1::TeamController < ApplicationController

    acts_as_token_authentication_handler_for User, only: [:logout, :create, :delete, :update]

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
        render json: {message: "Turma #{team.name} deletada com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def team_params 
        params.require(:team).permit(:name, :user_id)
    end
end