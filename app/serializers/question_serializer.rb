class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :subject, :answer, :creator  
end
