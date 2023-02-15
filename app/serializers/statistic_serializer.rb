# Serializes de estatistica
class StatisticSerializer < ActiveModel::Serializer
  # Defines the attributes to be included in the JSON output.
  attributes :id, :questions_answered, :right_answers, :wrong_answers
end
