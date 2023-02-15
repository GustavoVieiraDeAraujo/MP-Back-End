# Representa um questionário no sistema
class Quiz < ApplicationRecord
  # Garante que o título e o assunto do questionário não estejam em branco
  validates :title, :subject, presence: true

  # Associa um quiz a várias perguntas
  has_many :quiz_question, dependent: :destroy

  # Associa um quiz a várias equipes
  has_many :team_quiz, dependent: :destroy

  # Associa um quiz a um usuário
  belongs_to :user

  # Associa um quiz a uma equipe
  belongs_to :team
end
