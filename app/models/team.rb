# Representa uma equipe no sistema
class Team < ApplicationRecord
  # Uma equipe pode ter muitas associações de estudante
  has_many :student_team, dependent: :destroy

  # Uma equipe pode ter muitos quizzes associados
  has_many :team_quiz, dependent: :destroy

  # Garante que o nome da equipe esteja presente
  validates :name, presence: true

  # Associa uma equipe com um usuário
  belongs_to :user
end
