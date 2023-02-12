class Quiz < ApplicationRecord
  validates :title, :subject, presence: true
  has_many :quiz_question, dependent: :destroy
  has_many :team_quiz, dependent: :destroy
  belongs_to :user
  belongs_to :team
end
