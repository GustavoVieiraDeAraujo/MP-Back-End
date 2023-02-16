require 'rails_helper'

# Teste do modelo StudentTeam
RSpec.describe StudentTeam, type: :model do
  # Teste da factory
  describe 'Factory' do
    context 'When using standard factory' do
      it { expect(build(:student_team)).to be_valid }
    end
  end

  # Testes de validação
  describe 'Validates' do
    # Teste quando StudentTeam não tem team_id
    context 'when StudentTeam has no team_id' do
      it { expect(build(:student_team, team: nil)).to be_invalid }
    end

    # Teste quando StudentTeam não tem user_id
    context 'when StudentTeam has no user_id' do
      it { expect(build(:team, user: nil)).to be_invalid }
    end
  end
end

