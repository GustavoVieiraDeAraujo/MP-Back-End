# Classe que serializa o modelo Quiz para ser usado na API
class QuizSerializer < ActiveModel::Serializer
  # Atributos do modelo que serão incluídos na serialização
  attributes :id, :title, :subject, :owner

  # Método para serializar o proprietário do quiz (usuário que criou o quiz)
  def owner
    user = User.find_by!(id: object.user_id)
    {
      id: user.id,
      name: user.name
    }
  end
end
