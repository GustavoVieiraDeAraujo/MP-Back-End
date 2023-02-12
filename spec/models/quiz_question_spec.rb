require 'rails_helper'

RSpec.describe QuizQuestion, type: :model do
  describe 'Factory' do
    context 'When using standart factory' do
      it { expect(build(:quiz_question)).to be_valid }
    end
  end
  describe 'Validates' do
    context 'when QuizQuestion has no quiz_id' do
      it { expect(build(:quiz_question, quiz: nil)).to be_invalid }
    end
    context 'when QuizQuestion has no question_id' do
      it { expect(build(:quiz_question, question: nil)).to be_invalid }
    end
  end
end
