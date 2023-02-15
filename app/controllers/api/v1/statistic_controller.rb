module Api
  module V1
    # Controlador para gerenciar estatisticas.
    class StatisticController < ApplicationController
      # Autentica o token de autenticação do usuario para as ações de delete e update.
      acts_as_token_authentication_handler_for User, only: %i[delete update]

      # ==== Ação para listar todos as estatisticas cadastrados no sistema.
      #
      # Busca por todos as estatisticas no banco de dados.
      #
      # ==== Exemplo de uso:
      #
      #   GET /estatistic
      #
      # Retorna um objeto JSON com os dados de todos as estatisticas e um status HTTP 200 (OK).
      # Se a estatistica ou o usuario não existir, retorna um status HTTP 400(bad_request)
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro durante a listagem .
      #
      def index
        statistics = Statistic.all
        render json: statistics, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      # ==== Ação para exibir as estatistica pelo ID.
      #
      # Busca pelo ID especifico da estatistica.
      #
      # ==== Exemplo de uso:
      #
      #   GET /estatistic/:id
      #
      # Retorna um objeto JSON com as informações da estatistica e um status HTTP 200 (OK).
      # Se o estatistica não existir, retorna um status HTTP 404 (Not Found).
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro durante a busca.
      #

      def show
        statistic = Statistic.find(params[:id])
        render json: statistic, status: :ok
      rescue StandardError => e
        render json: e, status: :not_found
      end

      # ==== Ação para criar uma estatistica.
      #
      # Utiliza os parametros necessários para cria um estatistica.
      #
      # ==== Exemplo de uso:
      #
      #   POST /statistic
      #   params: { question_answered: 0, right_answer: 0, wrong_answers: 0 }
      #
      # Cria uma nova estatistica com os parâmetros passados e retorna um objeto JSON com as informações da estatistica criado e um status HTTP 201 (Created).
      # Caso os devidos paremetros não exisita retorna o status de 422 (unprocessable_entity)
      #
      # Raises:
      # - StandardError: se ocorrer um erro durante a criação do estatistica.
      #

      def update
        statistic = Statistic.find(params[:id])
        statistic.update!(statistics_params)
        render json: statistic, status: :ok
      rescue StandardError => e
        render json: e, status: :unprocessable_entity
      end

      # Metodo privado que so tera acesso pela classe Statistic

      private

      # Retorna um hash sanitizado de parâmetros de statistic para criar, atualizar ou deletar uma turma.
      #
      # O hash inclui as seguintes chaves:
      # - question_answered: questões realizadas pelo usuario (int)
      # - right_answers: questões respondidas corretas pelo usuario (int)
      # - wrong_answers: questões que o usuario errou (int)
      #
      # Exemplo de uso:
      #   def update
      #     statistic = Statistic.Update(statistic_params)
      #     # ...
      #   end
      #
      # Retorna: um hash de parâmetros da estatistica sanitizados
      def statistics_params
        params.require(:statistic).permit(:questions_answered, :right_answers, :wrong_answers)
      end
    end
  end
end
