class StatisticSerializer < ActiveModel::Serializer
  attributes :id, :questions_answered, :right_answers, :wrong_answers
end
