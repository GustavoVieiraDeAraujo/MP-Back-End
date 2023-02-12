class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :student_team, dependent: :destroy
  has_many :student_quiz, dependent: :destroy
  has_many :student_question, dependent: :destroy
  has_many :question
  belongs_to :statistic
  validates_numericality_of :enrollment, only_integer: true
 
  
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
