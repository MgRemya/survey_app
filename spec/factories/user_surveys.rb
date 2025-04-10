FactoryBot.define do
  factory :user_survey do
    association :user
    association :survey
  end
end
