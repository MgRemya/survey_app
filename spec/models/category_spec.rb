require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with name and survey" do
    category = build(:category)
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = build(:category, name: nil)
    expect(category).not_to be_valid
  end

  it "is invalid without a survey" do
    category = build(:category, survey: nil)
    expect(category).not_to be_valid
  end
end
