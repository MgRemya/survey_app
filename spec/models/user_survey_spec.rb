require 'rails_helper'

RSpec.describe UserSurvey, type: :model do
  it "is valid with user and survey" do
    user_survey = build(:user_survey)
    expect(user_survey).to be_valid
  end

  it "is invalid without a user" do
    user_survey = build(:user_survey, user: nil)
    expect(user_survey).not_to be_valid
  end

  it "is invalid without a survey" do
    user_survey = build(:user_survey, survey: nil)
    expect(user_survey).not_to be_valid
  end
end
