class User < ApplicationRecord
  before_create do
    statistic = Statistic.create!(questions_answered: 0, right_answers: 0, wrong_answers: 0)
    statistic.save!
    self.statistic_id = statistic.id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
