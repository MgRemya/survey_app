FactoryBot.define do
  factory :question do
    sequence(:content) { |n| "What do you think about topic \#{n}?" }
    association :category
  end
end
