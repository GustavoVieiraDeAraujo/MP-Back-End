require 'rails_helper'

RSpec.describe Statistic, type: :model do
  describe "Factory" do
    context 'When using standart factory' do
      it { expect(build(:statistic)).to be_valid }
    end 
  end
  describe 'Validates' do
    context 'when Statistic has no question_answered' do
      it { expect(build(:statistic, questions_answered: nil)).to be_invalid }
    end
    context 'when Statistic has no right_answers' do
      it { expect(build(:statistic, right_answers: nil)).to be_invalid }
    end
    context 'when Statistic has no wrong_answers' do
      it { expect(build(:statistic, wrong_answers: nil)).to be_invalid }
    end
    context 'when QuestionsAnswerd is invalid' do
      it { expect(build(:statistic, questions_answered: 0)).to be_invalid }
    end
    context 'when RightAnswer is invalid' do
      it { expect(build(:statistic, questions_answered: 0)).to be_invalid }
    end
    context 'when WrongAnswer is invalid' do
      it { expect(build(:statistic, questions_answered: 0)).to be_invalid }
    end
  end
end