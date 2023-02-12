require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe "Factory" do
    context 'When using standart factory' do
      it { expect(build(:quiz)).to be_valid }
    end 
  end
  describe 'Validates' do
    context 'when Quiz has no title' do
      it { expect(build(:quiz, title: nil)).to be_invalid }
    end
    context 'when Quiz has no subject' do
      it { expect(build(:quiz, subject: nil)).to be_invalid }
    end
    context 'when Quiz has no user_id' do
      it { expect(build(:quiz, user: nil)).to be_invalid }
    end
    context 'when Quiz has no team_id' do
      it { expect(build(:quiz, team: nil)).to be_invalid }
    end
  end
end
