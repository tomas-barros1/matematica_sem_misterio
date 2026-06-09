module Gamification
  class AchievementUnlocker
    def initialize(user:)
      @user = user
    end

    def call
      unlocked = []

      Achievement.find_each do |achievement|
        next unless eligible?(achievement)
        next if user.user_achievements.exists?(achievement: achievement)

        user.user_achievements.create!(achievement: achievement, unlocked_at: Time.current)
        unlocked << achievement
      end

      unlocked
    end

    private

    attr_reader :user

    def eligible?(achievement)
      return false if user.xp < achievement.xp_requirement
      return false if achievement.streak_requirement.present? && user.streak < achievement.streak_requirement
      return false if achievement.lesson_completion_requirement.present? && user.lesson_completions.count < achievement.lesson_completion_requirement

      true
    end
  end
end
