FactoryBot.define do
  factory :quiz do
    title { 'MyString' }
    subject { 'MyString' }
    user { create(:user) }
  end
end
