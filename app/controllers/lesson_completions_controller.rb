class LessonCompletionsController < AuthenticatedController
  def create
    lesson = Lesson.find(params[:lesson_id])
    result = LessonCompletionService.new(
      user: current_user,
      lesson: lesson,
      answers: completion_params[:answers] || {}
    ).call

    flash[:notice] = result.notice
    redirect_to lesson_path(lesson)
  end

  private

  def completion_params
    params.fetch(:lesson_completion, ActionController::Parameters.new).permit(answers: {})
  end
end
