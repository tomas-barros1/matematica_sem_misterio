module Admin
  class SubjectsController < BaseController
    before_action :set_subject, only: %i[show edit update destroy]

    def index
      @subjects = Subject.order(:position, :name)
    end

    def show; end

    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new(subject_params)
      if @subject.save
        redirect_to admin_subjects_path, notice: "Disciplina criada com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @subject.update(subject_params)
        redirect_to admin_subjects_path, notice: "Disciplina atualizada com sucesso."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @subject.destroy
      redirect_to admin_subjects_path, notice: "Disciplina removida com sucesso."
    end

    private

    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :description, :position)
    end
  end
end
