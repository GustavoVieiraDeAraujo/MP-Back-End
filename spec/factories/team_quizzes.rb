FactoryBot.define do
  factory :team_quiz do
    team { create(:team) }
    quiz { create(:quiz) }
  end
end
