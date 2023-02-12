class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :enrollment, :is_admin, :is_student, :is_teacher, :statistic_id, :authentication_token
end