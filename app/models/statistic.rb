class Statistic < ApplicationRecord
    validates :questions_answered, :right_answers, :wrong_answers, length:{minimum: 0, allow_nil: false}
    validate :right_value
    
    def right_value
        if right_answers && wrong_answers && questions_answered != nil
            if right_answers + wrong_answers != questions_answered
                errors.add(:base, "A soma dos resultados não bate com a quantidade de questões respondidas")
            end
        end
    end
    has_one :user
end
