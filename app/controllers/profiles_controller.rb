class ProfilesController < AuthenticatedController
  def show
    @user = current_user
    @completed_lessons = @user.lesson_completions.includes(lesson: :subject).order(completed_at: :desc)
    @achievements = @user.user_achievements.includes(:achievement).order(unlocked_at: :desc)
  end
end
