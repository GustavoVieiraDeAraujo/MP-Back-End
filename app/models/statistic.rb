class Statistic < ApplicationRecord
  validate :right_value
  validates :questions_answered, :right_answers, :wrong_answers, length: { minimum: 0, allow_nil: false }
  has_one :user
  def right_value
    return unless right_answers && wrong_answers && !questions_answered.nil?
    return unless right_answers + wrong_answers != questions_answered

    errors.add(:base, 'A soma dos resultados não bate com a quantidade de questões respondidas')
  end
end
