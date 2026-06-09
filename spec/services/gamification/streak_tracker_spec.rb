require "rails_helper"

RSpec.describe Gamification::StreakTracker do
  it "starts a streak for a first study day" do
    user = build(:user, streak: 0, last_study_at: nil)

    result = described_class.new(user: user, study_date: Date.current).call

    expect(result.streak).to eq(1)
    expect(result.bonus_xp).to eq(0)
  end

  it "increments the streak when studying on consecutive days" do
    user = build(:user, streak: 3, last_study_at: 1.day.ago)

    result = described_class.new(user: user, study_date: Date.current).call

    expect(result.streak).to eq(4)
    expect(result.bonus_xp).to eq(Gamification::XpCalculator::DAILY_STREAK_BONUS_XP)
  end
end
