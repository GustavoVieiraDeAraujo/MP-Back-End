FactoryBot.define do
  factory :user do
    email { 'teste@teste' }
    password { '0123456' }
    name { 'Teste' }
    enrollment { 123_456_789 }
    is_admin { true }
    is_teacher { true }
    is_student { true }
    statistics { create(:statistics) }
  end
end
