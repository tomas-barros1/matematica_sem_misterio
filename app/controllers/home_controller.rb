class HomeController < ApplicationController
  def index
    @featured_subjects = Subject.includes(lessons: :questions).order(:position, :name).limit(4)
    @top_students = User.student.order(xp: :desc, level: :desc).limit(3)
  end
end
