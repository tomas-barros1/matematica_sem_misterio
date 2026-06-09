module Gamification
  class StreakTracker
    Result = Struct.new(:streak, :bonus_xp, keyword_init: true)

    def initialize(user:, study_date: Time.current.to_date)
      @user = user
      @study_date = study_date
    end

    def call
      yesterday = study_date - 1.day

      if user.last_study_at&.to_date == study_date
        Result.new(streak: user.streak, bonus_xp: 0)
      elsif user.last_study_at&.to_date == yesterday
        Result.new(streak: user.streak + 1, bonus_xp: XpCalculator::DAILY_STREAK_BONUS_XP)
      else
        Result.new(streak: 1, bonus_xp: 0)
      end
    end

    private

    attr_reader :user, :study_date
  end
end
