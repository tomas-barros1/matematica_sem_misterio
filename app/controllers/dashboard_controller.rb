class DashboardController < AuthenticatedController
  def show
    @progress = Gamification::LevelCalculator.progress_for(current_user.xp)
    @recent_achievements = current_user.user_achievements.includes(:achievement).order(unlocked_at: :desc).limit(3)
    @completed_lessons = current_user.lesson_completions.includes(lesson: :subject).order(completed_at: :desc).limit(6)
    @recommended_lessons = Lesson.includes(:subject, :questions).where.not(id: current_user.lesson_completions.select(:lesson_id)).order(:position).limit(4)
  end
end
