require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without email" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "has a unique email" do
    create(:user, email: "test@example.com")
    user2 = build(:user, email: "test@example.com")
    expect(user2).not_to be_valid
  end
end
