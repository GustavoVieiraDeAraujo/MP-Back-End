class Question < ApplicationRecord
  has_many :student_question, dependent: :destroy
  has_many :quiz_question, dependent: :destroy
  validates :title, :description, :subject, :answer, presence: true 

  belongs_to :user
end
