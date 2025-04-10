require 'rails_helper'

RSpec.describe UserSurveyResponse, type: :model do
  it "is valid with all associations and score" do
    expect(build(:user_survey_response)).to be_valid
  end

  it "is invalid without a user" do
    response = build(:user_survey_response, user_survey: nil)
    expect(response).not_to be_valid
  end
end
