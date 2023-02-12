class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :subject, :answer, :user_id 
end
