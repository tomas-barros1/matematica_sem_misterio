class AchievementsController < AuthenticatedController
  def index
    @achievements = Achievement.order(:xp_requirement, :name)
    @unlocked_ids = current_user.user_achievements.pluck(:achievement_id)
  end
end
