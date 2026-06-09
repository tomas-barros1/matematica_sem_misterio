require "rails_helper"

RSpec.describe LessonCompletionService do
  it "creates a completion and awards xp on the first attempt" do
    subject_model = create(:subject)
    lesson = create(:lesson, subject: subject_model)
    create_list(:question, 2, lesson: lesson)
    user = create(:user, xp: 0, streak: 0, last_study_at: nil)
    answers = lesson.questions.index_by(&:id).transform_values { "b" }

    result = described_class.new(user: user, lesson: lesson, answers: answers).call

    expect(result.xp_earned).to eq((2 * Gamification::XpCalculator::CORRECT_ANSWER_XP) + Gamification::XpCalculator::LESSON_COMPLETION_XP)
    expect(user.reload.xp).to eq(result.xp_earned)
    expect(user.lesson_completions.count).to eq(1)
  end
end
