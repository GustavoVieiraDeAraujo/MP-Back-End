class Quiz < ApplicationRecord
  has_many :student_quiz, dependent: :destroy
  has_many :quiz_question, dependent: :destroy

  validates :title, :subject, presence: true

  belongs_to :user
  belongs_to :team
end
