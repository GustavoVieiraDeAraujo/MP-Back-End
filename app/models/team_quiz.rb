# Representa a associação entre uma equipe e um quiz no sistema
class TeamQuiz < ApplicationRecord
  # Associa um TeamQuiz a uma equipe
  belongs_to :team

  # Associa um TeamQuiz a um quiz
  belongs_to :quiz
end

