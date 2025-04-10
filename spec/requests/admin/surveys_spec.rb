require 'rails_helper'

RSpec.describe "Admin::Surveys", type: :request do
  let(:admin) { create(:user, role: "superadmin") }

  before do
    post login_path, params: { email: admin.email, password: "password" }
  end

  it "loads the index page" do
    get admin_surveys_path
    expect(response).to be_successful
  end
end
