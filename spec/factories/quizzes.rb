FactoryBot.define do
  factory :quiz do
    title { 'MyString' }
    subject { 'MyString' }
    user { create(:user) }
    team { create(:team) }
  end
end
