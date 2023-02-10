FactoryBot.define do
  factory :student_team do
    team { create(:team) }
    user { create(:user) }
  end
end
