class Question < ApplicationRecord
  validates :title, :description, :subject, :answer, presence: true
  has_many :quiz_question, dependent: :destroy
  belongs_to :user
end
