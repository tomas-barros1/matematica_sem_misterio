module Admin
  class QuestionsController < BaseController
    before_action :set_question, only: %i[show edit update destroy]

    def index
      @questions = Question.includes(:lesson).order("lessons.position ASC, questions.position ASC").references(:lesson)
    end

    def show; end

    def new
      @question = Question.new(lesson_id: params[:lesson_id])
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to admin_questions_path, notice: "Questão criada com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to admin_questions_path, notice: "Questão atualizada com sucesso."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_questions_path, notice: "Questão removida com sucesso."
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:lesson_id, :kind, :statement, :option_a, :option_b, :option_c, :option_d, :correct_answer, :explanation, :position)
    end
  end
end
