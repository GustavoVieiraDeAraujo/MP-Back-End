require 'rails_helper'

RSpec.describe StudentQuiz, type: :model do
  describe 'Factory' do
    context 'When using standart factory' do
      it { expect(build(:student_quiz)).to be_valid }
    end
  end
  describe 'Validates' do
    context 'when StudentQuiz has no quiz_id' do
      it { expect(build(:student_quiz, quiz: nil)).to be_invalid }
    end
    context 'when StudentQuiz has no user_id' do
      it { expect(build(:student_quiz, user: nil)).to be_invalid }
    end
  end
end
