class QuizSerializer < ActiveModel::Serializer
  attributes :id, :title, :subject, :user_id, :team_id
end

