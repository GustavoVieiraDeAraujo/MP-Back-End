class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :subject, :answer, :owner

  def owner
    user = User.find_by!(id: object.user_id)
    {
      id: user.id,
      name: user.name
    }
  end
end
