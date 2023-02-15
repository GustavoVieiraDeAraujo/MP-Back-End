# Serializer para formatar objetos Question como JSON
class QuestionSerializer < ActiveModel::Serializer
  # Atributos a serem serializados
  attributes :id, :title, :description, :subject, :answer, :owner

  # Método para formatar o objeto 'owner'
  # @return [Hash] objeto formatado com id e nome do proprietário da questão
  def owner
    user = User.find_by!(id: object.user_id)
    {
      id: user.id,
      name: user.name
    }
  end
end
