# Representa um usuário no sistema
class User < ApplicationRecord
  # Usa a gema 'acts_as_token_authenticatable' para fornecer autenticação baseada em token
  acts_as_token_authenticatable

  # Garante que o nome do usuário esteja presente
  validates :name, presence: true

  # Garante que a matrícula do usuário seja única
  validates_uniqueness_of :enrollment

  # Garante que a matrícula do usuário seja um número inteiro
  validates_numericality_of :enrollment, only_integer: true

  # Um usuário pode fazer parte de muitas equipes de estudantes
  has_many :student_team, dependent: :destroy

  # Um usuário pode criar muitas questões
  has_many :question, dependent: :destroy

  # Um usuário pode criar muitos quizzes
  has_many :quiz, dependent: :destroy

  # Um usuário pode fazer parte de muitas equipes
  has_many :team, dependent: :destroy

  # Cria um novo objeto Statistic para o usuário antes que o usuário seja criado
  before_create do
    statistic = Statistic.create!(questions_answered: 0, right_answers: 0, wrong_answers: 0)
    statistic.save!
    self.statistic_id = statistic.id
  end

  # Inclui vários módulos do devise para autenticação
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
