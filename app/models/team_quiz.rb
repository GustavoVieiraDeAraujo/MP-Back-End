class TeamQuiz < ApplicationRecord
  belongs_to :team
  belongs_to :quiz
end
