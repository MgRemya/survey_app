FactoryBot.define do
  factory :user_survey_response do
    association :user_survey
    association :question
    association :answer
    association :category
    score { 5 }
  end
end
