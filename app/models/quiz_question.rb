# Representa a associação entre um questionário e uma pergunta
class QuizQuestion < ApplicationRecord
  # Associa uma questão a um questionário
  belongs_to :quiz

  # Associa um questionário a uma pergunta
  belongs_to :question
end
