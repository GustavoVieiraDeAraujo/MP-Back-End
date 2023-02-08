class Api::V1::TeamController < ApplicationController

    # acts_as_token_authentication_handler_for User, only: [:logout, :create, :delete, :update]

    def index
        team = Team.all
        render json: team, status: :ok
    end

    def show 
        team = Team.find(params[:id])
        render json: team, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        team = Team.create!(user_params)
        team.save!
        render json: team, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    
    def update
        team = Team.find(params[:id])
        team.update!(user_params)
        render json: team, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        team = Team.find(params[:id])
        team.destroy!
        render json: {message: "Turma deletada com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def team_params 
        params.require(:team).permit(:name, :teacher_id)
    end
end
