class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :enrollment, :password, :is_admin, :is_student, :is_teacher
end
