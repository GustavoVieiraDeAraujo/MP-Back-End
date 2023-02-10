class Question < ApplicationRecord
  has_many :student_question, dependent: :destroy
  has_many :quiz_question, dependent: :destroy

  belongs_to :user
end
