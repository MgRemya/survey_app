require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is valid with content and category" do
    question = build(:question)
    expect(question).to be_valid
  end

  it "is invalid without content" do
    question = build(:question, content: nil)
    expect(question).not_to be_valid
  end

  it "is invalid without category" do
    question = build(:question, category: nil)
    expect(question).not_to be_valid
  end
end
