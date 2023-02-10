class User < ApplicationRecord

  has_many :student_team, dependent: :destroy
  has_many :student_quiz, dependent: :destroy
  has_many :student_question, dependent: :destroy
 
  
  before_create do
    statistic = Statistic.create!(questions_answered:0, right_answers:0, wrong_answers:0)
    statistic.save!
    self.statistic_id = statistic.id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
