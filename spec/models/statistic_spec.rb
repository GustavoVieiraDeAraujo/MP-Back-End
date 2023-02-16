# Arquivo: statistic_spec.rb
# Este arquivo contém testes para o modelo Statistic.

require 'rails_helper'

# Define um conjunto de testes para a classe Statistic.
RSpec.describe Statistic, type: :model do

  # Define um conjunto de testes para a Factory de Statistic.
  describe 'Factory' do
    context 'When using standart factory' do
      # Verifica se um objeto criado com a factory padrão é válido.
      it { expect(build(:statistic)).to be_valid }
   
      # A linha acima utiliza a sintaxe do RSpec para definir uma expectativa.
      # O método build é fornecido pelo FactoryBot, que é utilizado para criar objetos em testes.
      # O método be_valid é fornecido pelo Rails e verifica se o objeto criado é válido.
    end
  end

  # Define um conjunto de testes para as validações do modelo Statistic.
  describe 'Validates' do
    context 'when Statistic has no question_answered' do
      # Verifica se um objeto criado sem question_answered é inválido.
      it { expect(build(:statistic, questions_answered: nil)).to be_invalid }
    end
    context 'when Statistic has no right_answers' do
      # Verifica se um objeto criado sem right_answers é inválido.
      it { expect(build(:statistic, right_answers: nil)).to be_invalid }
    end
    context 'when Statistic has no wrong_answers' do
      # Verifica se um objeto criado sem wrong_answers é inválido.
      it { expect(build(:statistic, wrong_answers: nil)).to be_invalid }
    end
    context 'when QuestionsAnswerd is invalid' do
      # Verifica se um objeto criado com questions_answered igual a 0 é inválido.
      it { expect(build(:statistic, questions_answered: 0)).to be_invalid }
    end
    context 'when RightAnswer is invalid' do
      # Verifica se um objeto criado com right_answers igual a 0 é inválido.
      it { expect(build(:statistic, questions_answered: 0)).to be_invalid }
    end
    context 'when WrongAnswer is invalid' do
      # Verifica se um objeto criado com wrong_answers igual a 0 é inválido.
      it { expect(build(:statistic, questions_answered: 0)).to be_invalid }
    end
  end
end

