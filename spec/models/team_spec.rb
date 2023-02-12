require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'Factory' do
    context 'when using standart factory' do
      it { expect(build(:team)).to be_valid }
    end
  end
  describe 'Validates' do
    context 'when team has no name' do
      it { expect(build(:team, name: nil)).to be_invalid }
    end
    context 'when team has no user_id' do
      it { expect(build(:team, user: nil)).to be_invalid }
    end
  end
end
