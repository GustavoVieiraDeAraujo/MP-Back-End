class Team < ApplicationRecord
  has_many :student_team, dependent: :destroy

  belongs_to :user
  
end
