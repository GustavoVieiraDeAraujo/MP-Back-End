# Representa uma pergunta no sistema
class Question < ApplicationRecord
  # Garante que o título, descrição, assunto e resposta da pergunta não estejam em branco
  validates :title, :description, :subject, :answer, presence: true

  # Associa uma pergunta a vários quiz
  has_many :quiz_question, dependent: :destroy

  # Associa uma pergunta a um usuário
  belongs_to :user
end
