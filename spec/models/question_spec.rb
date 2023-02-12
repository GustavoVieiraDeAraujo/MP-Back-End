require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "Factory" do
    context 'When using standart factory' do
      it { expect(build(:question)).to be_valid }
    end 
  end
  describe 'Validates' do
    context 'when Question has no title' do
      it { expect(build(:question, title: nil)).to be_invalid }
    end
    context 'when Question has no description' do
      it { expect(build(:question, description: nil)).to be_invalid }
    end
    context 'when Question has no subject' do
      it { expect(build(:question, subject: nil)).to be_invalid }
    end
    context 'when Question has no answer' do
      it { expect(build(:question, answer: nil)).to be_invalid }
    end
    context 'when Question has no user_id' do
      it { expect(build(:question, user: nil)).to be_invalid }
    end
  end
end
