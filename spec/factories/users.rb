FactoryBot.define do
  sequence :user_email do |n|
    "test#{n}@test"
  end
  sequence :user_enrollment do |n|
    123_456_789 + n
  end
  factory :user do
    email { generate(:user_email) }
    password { '0123456' }
    name { 'Teste' }
    enrollment { generate(:user_enrollment) }
    is_admin { true }
    is_teacher { true }
    is_student { true }
    statistic_id { create(:statistic).id }
  end
  factory :statistic do
    questions_answered { 5 }
    wrong_answers { 3 }
    right_answers { 2 }
  end
end
