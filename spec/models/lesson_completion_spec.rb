require "rails_helper"

RSpec.describe LessonCompletion, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }
  it { is_expected.to validate_presence_of(:completed_at) }

  it "validates uniqueness per user and lesson" do
    create(:lesson_completion)
    duplicate = build(:lesson_completion, user: User.last, lesson: Lesson.last)

    expect(duplicate).not_to be_valid
  end
end
