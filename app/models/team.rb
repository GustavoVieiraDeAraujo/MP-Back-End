class Team < ApplicationRecord
  has_many :student_team, dependent: :destroy
  has_many :team_quiz, dependent: :destroy
  validates :name, presence: true
  belongs_to :user
  end
