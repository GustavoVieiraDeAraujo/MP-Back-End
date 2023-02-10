FactoryBot.define do
  factory :quiz_question do
    quiz { create(:quiz) }
    question { create(:question) }
  end
end
