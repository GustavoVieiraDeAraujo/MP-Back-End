FactoryBot.define do
  factory :question do
    title { 'MyString' }
    description { 'MyText' }
    subject { 'MyString' }
    answer { 'MyString' }
    user { create(:user) }
  end
end
