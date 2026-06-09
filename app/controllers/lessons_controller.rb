class LessonsController < AuthenticatedController
  def index
    @subjects = Subject.includes(lessons: :questions).order(:position, :name)
  end

  def show
    @lesson = Lesson.includes(:subject, :questions).find(params[:id])
    @completion = current_user.lesson_completions.find_by(lesson: @lesson)
    @progress = Gamification::LevelCalculator.progress_for(current_user.xp)
  end
end
