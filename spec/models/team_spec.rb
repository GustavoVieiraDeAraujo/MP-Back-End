require 'rails_helper'

RSpec.describe Team, type: :model do
  # Testes para o Factory
  describe 'Factory' do
    context 'when using standart factory' do
      it { expect(build(:team)).to be_valid }
    end
  end
  
  # Testes para as validações do model
  describe 'Validates' do
    # Contexto: quando a equipe não tem um nome
    context 'when team has no name' do
      it { expect(build(:team, name: nil)).to be_invalid }
    end
    
    # Contexto: quando a equipe não tem um usuário associado
    context 'when team has no user_id' do
      it { expect(build(:team, user: nil)).to be_invalid }
    end
  end
end

