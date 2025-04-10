require 'rails_helper'

RSpec.describe "User Sessions", type: :request do
  let!(:user) { create(:user, password: "password") }

  it "logs in with valid credentials" do
    post login_path, params: { email: user.email, password: "password" }
    expect(response).to redirect_to(dashboard_path)
    follow_redirect!
    expect(response.body).to include("Welcome")
  end

  it "does not log in with invalid credentials" do
    post login_path, params: { email: user.email, password: "wrongpass" }
    expect(response.body).to include("Invalid email or password")
  end
end
