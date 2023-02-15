# Representa a associação entre um estudante e uma equipe no sistema
class StudentTeam < ApplicationRecord
  # Associa um StudentTeam a uma equipe
  belongs_to :team

  # Associa um StudentTeam a um usuário
  belongs_to :user
end

