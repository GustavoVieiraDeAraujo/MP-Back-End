require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Teste da factory
  describe 'Factory' do
    context 'when using standart factory' do
      it { expect(build(:user)).to be_valid }
    end
  end
  
  # Testes de validação
  describe 'Validates' do
    
    # Teste de presença do email
    context 'when user has no email' do
      it { expect(build(:user, email: nil)).to be_invalid }
    end
    
    # Teste de presença da senha
    context 'when user has no Password' do
      it { expect(build(:user, password: nil)).to be_invalid }
    end
    
    # Teste de presença do nome
    context 'when user has no name' do
      it { expect(build(:user, name: nil)).to be_invalid }
    end
    
    # Teste de presença da matrícula
    context 'when user has no enrollment' do
      it { expect(build(:user, enrollment: nil)).to be_invalid }
    end
    
    # Teste de formato da matrícula
    context 'when enrollment is not a integer' do
      it { expect(build(:user, enrollment: 'asdf')).to be_invalid }
    end
    
    # Teste de unicidade do email
    context 'when user email has no unique' do
      it do
        create(:user, email: 'email@unique')
        expect(build(:user, email: 'email@unique')).to be_invalid
      end
    end
    
    # Teste de unicidade da matrícula
    context 'when user enrollment has no unique' do
      it do
        create(:user, enrollment: 123_456_789)
        expect(build(:user, enrollment: 123_456_789)).to be_invalid
      end
    end
  end
end
