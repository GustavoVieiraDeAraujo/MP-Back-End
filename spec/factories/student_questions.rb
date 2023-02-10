FactoryBot.define do
  factory :student_question do
    user { create(:user) }
    question { create(:question) }
  end
end
