require 'rails_helper'

RSpec.describe TeamQuiz, type: :model do
  # Testa a factory
  describe 'Factory' do
    # Testa a criação de um TeamQuiz com a factory padrão
    context 'Quando utilizando a factory padrão' do
      it { expect(build(:team_quiz)).to be_valid }
    end
  end

  # Testa as validações do modelo
  describe 'Validações' do
    # Testa se um TeamQuiz sem team_id é inválido
    context 'Quando TeamQuiz não possui team_id' do
      it { expect(build(:team_quiz, team: nil)).to be_invalid }
    end
    # Testa se um TeamQuiz sem quiz_id é inválido
    context 'Quando TeamQuiz não possui quiz_id' do
      it { expect(build(:team_quiz, quiz: nil)).to be_invalid }
    end
  end
end

