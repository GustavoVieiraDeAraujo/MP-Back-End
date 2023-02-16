# Arquivo: quiz_question_spec.rb
# Este arquivo contém testes para o modelo QuizQuestion.

require 'rails_helper'

# Define um conjunto de testes para a classe QuizQuestion.
RSpec.describe QuizQuestion, type: :model do

  # Define um conjunto de testes para a Factory de QuizQuestion.
  describe 'Factory' do
    context 'When using standart factory' do
      # Verifica se um objeto criado com a factory padrão é válido.
      it { expect(build(:quiz_question)).to be_valid }
    end
  end

  # Define um conjunto de testes para validações de QuizQuestion.
  describe 'Validates' do
    context 'when QuizQuestion has no quiz_id' do
      # Verifica se QuizQuestion é inválido quando não tem um quiz_id definido.
      it { expect(build(:quiz_question, quiz: nil)).to be_invalid }
    end
    context 'when QuizQuestion has no question_id' do
      # Verifica se QuizQuestion é inválido quando não tem um question_id definido.
      it { expect(build(:quiz_question, question: nil)).to be_invalid }
    end
  end
end

