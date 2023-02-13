require 'rails_helper'

RSpec.describe StudentTeam, type: :model do
  describe 'Factory' do
    context 'When using standart factory' do
      it { expect(build(:student_team)).to be_valid }
    end
  end
  describe 'Validates' do
    context 'when StudentTeam has no team_id' do
      it { expect(build(:student_team, team: nil)).to be_invalid }
    end
    context 'when StudentTeam has no user_id' do
      it { expect(build(:team, user: nil)).to be_invalid }
    end
  end
end
