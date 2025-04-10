require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  let(:user) { create(:user, password: "password") }
  let(:survey) { create(:survey, creator: user) }

  before do
    post login_path, params: { email: user.email, password: "password" }
  end

  it "shows the survey page for logged-in user" do
    get survey_path(survey)
    expect(response).to be_successful
    expect(response.body).to include(survey.title)
  end
end
