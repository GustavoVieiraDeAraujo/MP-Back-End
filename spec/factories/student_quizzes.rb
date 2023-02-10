FactoryBot.define do
  factory :student_quiz do
    quiz { create(:quiz) }
    user { create(:user) }
  end
end
