class Api::V1::UserController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:logout, :create, :delete, :update]

  def login
    user = User.find_by!(email: params[:email])
    if user.valid_password?(params[:password])
      render json: user, status: :ok
    else
      head(:unauthorized)
    end
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def logout
    current_user.authentication_token = nil
    current_user.save!
    render json: { message: 'Logout concluido com sucesso' }, status: :ok
  rescue StandardError => e
    render json: { message: e.message }, status: :bad_request
  end

    def index
        user = User.all
        render json: user, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  rescue StandardError
    head(:not_found)
  end

  def create
    user = User.create!(user_params)
    user.save!
    render json: user, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user, status: :ok
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  def delete
    user = User.find(params[:id])
    user.destroy!
    render json: { message: "Usuario #{user.name} deletado com sucesso" }, status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  private

  def user_params
    params.require(:user).permit(:name, :enrollment, :is_admin, :is_student, :is_teacher, :email, :password, :authentication_token)
  end
end
