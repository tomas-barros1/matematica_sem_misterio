require "rails_helper"

RSpec.describe Lesson, type: :model do
  it { is_expected.to belong_to(:subject) }
  it { is_expected.to have_many(:questions).dependent(:destroy) }
  it { is_expected.to have_many(:lesson_completions).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
end
