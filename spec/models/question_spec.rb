require "rails_helper"

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:lesson) }
  it { is_expected.to validate_presence_of(:statement) }
  it { is_expected.to validate_presence_of(:correct_answer) }

  it "accepts a correct multiple choice answer" do
    question = build(:question)

    expect(question).to be_valid
    expect(question.answer_correct?("b")).to be(true)
  end

  it "accepts a true/false answer" do
    question = build(:question, :true_false)

    expect(question).to be_valid
    expect(question.answer_correct?("true")).to be(true)
  end
end
