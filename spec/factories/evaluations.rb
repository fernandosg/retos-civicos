# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :evaluation do
    association :challenge
    association :judge
    evaluation_file "MyString"
  end
end
