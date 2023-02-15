module Api
  module V1
    # Controlador para gerenciar usuários.
    class UserController < ApplicationController
      # Autentica o token de autenticação do usuário para as ações de logout, delete e update.
      acts_as_token_authentication_handler_for User, only: %i[logout delete update]

      # ==== Método de login do usuário.
      #
      # Busca um usuário pelo email e verifica se a senha fornecida é válida.
      #
      # ==== Exemplo de uso:
      #
      #   GET /login
      #   params: { email: 'user@example.com', password: 'secret' }
      #
      # Retorna um objeto JSON com os dados do usuário e um status HTTP 200 (OK) se a autenticação for bem-sucedida.
      # Retorna um cabeçalho HTTP 401 (Não autorizado) se as credenciais forem inválidas.
      #
      # ==== Raises:
      # - ActiveRecord::RecordNotFound: se o usuário não for encontrado.
      # - StandardError: se ocorrer um erro durante a autenticação.
      #

      def login
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
          render json: user, status: :ok
        else
          head(:unauthorized)
        end
      rescue StandardError => e
        render json: { message: e.message }, status: :unauthorized
      end

      # ==== Metodo de logout do usuario atual.
      #
      # Define o valor do token de autenticação do usuário como `nil` e salva o objeto do usuário para persistir a alteração no banco de dados.
      #
      # Retorna uma mensagem de sucesso em formato JSON com um status HTTP 200 (OK) se o salvamento for bem-sucedido.
      # Retorna uma mensagem de erro em formato JSON com um status HTTP 400 (Solicitação inválida) se ocorrer um erro durante o processo.
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro ao salvar o objeto do usuário.
      #
      def logout
        current_user.authentication_token = nil
        current_user.save!
        render json: { message: 'Logout concluido com sucesso' }, status: :ok
      rescue StandardError => e
        render json: { message: e.message }, status: :bad_request
      end

      # ==== Ação para listar todos os usuários cadastrados no sistema.
      #
      # Busca por todos os usuários no banco de dados.
      #
      # ==== Exemplo de uso:
      #
      #   GET /users
      #
      # Retorna um objeto JSON com os dados de todos os usuários e um status HTTP 200 (OK).
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro durante a listagem retornara um status HTTP 400(bad_request).
      #
      def index
        user = User.all
        render json: user, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      # ==== Ação para exibir as informações de um usuário pelo ID.
      #
      # Busca pelo ID especifico do usuário.
      #
      # ==== Exemplo de uso:
      #
      #   GET /users/:id
      #
      # Retorna um objeto JSON com as informações do usuário e um status HTTP 200 (OK).
      # Se o usuário não existir, retorna um status HTTP 404 (Not Found).
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro durante a busca.
      #
      def show
        user = User.find(params[:id])
        render json: user, status: :ok
      rescue StandardError
        head(:not_found)
      end

      # ==== Ação para criar um usuário.
      #
      # Utiliza os parametros necessários para cria um usuário.
      #
      # ==== Exemplo de uso:
      #
      #   POST /users
      #   params: { name: 'user', enrollment: 000000000, is_admin: true, is_teacher: true, is_student: true, email:user@exemple.com, password: 'secret' }
      #
      # Cria um novo usuário com os parâmetros passados e retorna um objeto JSON com as informações do usuário criado e um status HTTP 201 (Created).
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro durante a criação do usuário.
      #
      def create
        user = User.create!(user_params)
        user.save!
        render json: user, status: :created
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      # ==== Ação para atualizar as informações de um usuário.
      #
      # Busca pela ID específica do usuário para atualiza-la
      #
      # ==== Exemplo de uso:
      #
      #   PUT /users/:id
      #   params: { name: 'user', enrollment: 000000000, is_admin: true, is_teacher: true, is_student: true, email:user@exemple.com, password: 'secret' }
      #
      #
      # Atualiza as informações do usuário com os parâmetros passados e retorna um objeto JSON com as informações do usuário atualizado e um status HTTP 200 (OK).
      # Se o usuário não existir, retorna um status HTTP 422 (unprocessable_entity).
      #
      # ==== Raises:
      # - StandardError: se ocorrer um erro durante a atualização do usuário.
      #
      def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :ok
      rescue StandardError => e
        render json: e, status: :unprocessable_entity
      end

      # Método para excluir um usuário do banco de dados
      #
      # Exemplo de uso:
      #
      #   DELETE /users/:id
      #
      #   # Response
      #     "message": "Usuario John Doe deletado com sucesso"
      #
      # Em caso de erro, é renderizada uma mensagem de erro com o status HTTP 400.
      def delete
        user = User.find(params[:id])
        user.destroy!
        render json: { message: "Usuario #{user.name} deletado com sucesso" }, status: :ok
      rescue StandardError => e
        render json: e, status: :bad_request
      end

      # Metodo privado que so sera acessdo pela classe User

      private

      # Retorna um hash sanitizado de parâmetros de usuário para criar ou atualizar um usuário.
      #
      # O hash inclui as seguintes chaves:
      # - name: o nome do usuário (string)
      # - enrollment: o código de matrícula do usuário (string)
      # - is_admin: um booleano indicando se o usuário é um administrador
      # - is_student: um booleano indicando se o usuário é um estudante
      # - is_teacher: um booleano indicando se o usuário é um professor
      # - email: o endereço de e-mail do usuário (string)
      # - password: a senha do usuário (string)
      #
      # Exemplo de uso:
      #   def create
      #     user = User.new(user_params)
      #     # ...
      #   end
      #
      # Retorna: um hash de parâmetros de usuário sanitizados

      def user_params
        params.require(:user).permit(:name, :enrollment, :is_admin, :is_student, :is_teacher, :email, :password)
      end
    end
  end
end
