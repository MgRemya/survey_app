require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "is valid with content and score" do
    answer = build(:answer)
    expect(answer).to be_valid
  end

  it "is invalid without content" do
    answer = build(:answer, content: nil)
    expect(answer).not_to be_valid
  end

  it "is invalid without score" do
    answer = build(:answer, score: nil)
    expect(answer).not_to be_valid
  end
end
