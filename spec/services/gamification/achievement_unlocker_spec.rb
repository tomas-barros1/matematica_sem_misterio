require "rails_helper"

RSpec.describe Gamification::AchievementUnlocker do
  it "unlocks eligible achievements" do
    user = create(:user, xp: 150, streak: 7)
    achievement = create(:achievement, xp_requirement: 100, streak_requirement: 7)

    unlocked = described_class.new(user: user).call

    expect(unlocked).to include(achievement)
    expect(user.user_achievements.count).to eq(1)
  end
end
