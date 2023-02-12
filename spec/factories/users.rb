FactoryBot.define do
  sequence :user_email do |n|
    "test#{n}@test"
  end
  factory :user do
    email {generate(:user_email)}
    password { '0123456' }
    name { 'Teste' }
    enrollment { 123_456_789 }
    is_admin { true }
    is_teacher { true }
    is_student { true }
    statistic { create(:statistic) }
  end
end
