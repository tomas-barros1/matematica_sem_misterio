module Admin
  class LessonsController < BaseController
    before_action :set_lesson, only: %i[show edit update destroy]

    def index
      @lessons = Lesson.includes(:subject).order("subjects.position ASC, lessons.position ASC").references(:subject)
    end

    def show; end

    def new
      @lesson = Lesson.new
    end

    def create
      @lesson = Lesson.new(lesson_params)
      if @lesson.save
        redirect_to admin_lessons_path, notice: "Lição criada com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @lesson.update(lesson_params)
        redirect_to admin_lessons_path, notice: "Lição atualizada com sucesso."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @lesson.destroy
      redirect_to admin_lessons_path, notice: "Lição removida com sucesso."
    end

    private

    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:subject_id, :title, :description, :position, :xp_reward, :active)
    end
  end
end
