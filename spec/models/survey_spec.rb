require 'rails_helper'

RSpec.describe Survey, type: :model do
  it "is valid with title and description" do
    expect(build(:survey)).to be_valid
  end

  it "is invalid without a title" do
    survey = build(:survey, title: nil)
    expect(survey).not_to be_valid
  end
end
