class Api::V1::StatisticController < ApplicationController

    # acts_as_token_authentication_handler_for User, only: [:delete, :update]
    
    def index
        statistics = Statistic.all
        render json: statistics, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        statistic = Statistic.find(params[:id])
        render json: statistic, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update
        statistic = Statistic.find(params[:id])
        statistic.update!(statistics_params)
        render json: statistic, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    private
    def statistics_params 
        params.require(:statistic).permit(:questions_answered, :right_answers, :wrong_answers)
    end
end
