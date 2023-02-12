require 'rails_helper'

RSpec.describe StudentQuestion, type: :model do
  describe "Factory" do
    context 'When using standart factory' do
      it { expect(build(:student_question)).to be_valid }
    end 
  end
  describe 'Validates' do
    context 'when StudentQuestion has no question_id' do
      it { expect(build(:student_question, question: nil)).to be_invalid }
    end
    context 'when StudentQuestion has no user_id' do
      it { expect(build(:student_question, user: nil)).to be_invalid }
    end
  end
end
