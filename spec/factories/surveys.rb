FactoryBot.define do
  factory :survey do
    title { "Employee Satisfaction Survey" }
    description { "A sample survey for employee engagement" }
    association :creator, factory: :user
  end
end
