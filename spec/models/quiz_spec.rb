# Arquivo: quiz_spec.rb
# Este arquivo contém testes para o modelo Quiz.

require 'rails_helper'

# Define um conjunto de testes para a classe Quiz.
RSpec.describe Quiz, type: :model do

  # Define um conjunto de testes para a Factory de Quiz.
  describe 'Factory' do
    context 'When using standart factory' do
      # Verifica se um objeto criado com a factory padrão é válido.
      it { expect(build(:quiz)).to be_valid }
    end
  end

  # Define um conjunto de testes para validações de Quiz.
  describe 'Validates' do
    context 'when Quiz has no title' do
      # Verifica se Quiz é inválido quando não tem um título definido.
      it { expect(build(:quiz, title: nil)).to be_invalid }
    end
    context 'when Quiz has no subject' do
      # Verifica se Quiz é inválido quando não tem um assunto definido.
      it { expect(build(:quiz, subject: nil)).to be_invalid }
    end
    context 'when Quiz has no user_id' do
      # Verifica se Quiz é inválido quando não tem um user_id definido.
      it { expect(build(:quiz, user: nil)).to be_invalid }
    end
    context 'when Quiz has no team_id' do
      # Verifica se Quiz é inválido quando não tem um team_id definido.
      it { expect(build(:quiz, team: nil)).to be_invalid }
    end
  end
end

