require 'rails_helper'

RSpec.describe TeamQuiz, type: :model do
  describe 'Factory' do
    context 'When using standart factory' do
      it { expect(build(:team_quiz)).to be_valid }
    end
  end
  describe 'Validates' do
    context 'when TeamQuiz has no team_id' do
      it { expect(build(:team_quiz, team: nil)).to be_invalid }
    end
    context 'when TeamQuiz has no quiz_id' do
      it { expect(build(:team_quiz, quiz: nil)).to be_invalid }
    end
  end
end
