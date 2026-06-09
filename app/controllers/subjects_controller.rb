class SubjectsController < AuthenticatedController
  def index
    @subjects = Subject.includes(lessons: :questions).order(:position, :name)
  end

  def show
    @subject = Subject.includes(lessons: :questions).find(params[:id])
  end
end
