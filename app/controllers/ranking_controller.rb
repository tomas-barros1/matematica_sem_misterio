class RankingController < AuthenticatedController
  def index
    @users = User.student.order(xp: :desc, level: :desc, name: :asc).limit(20)
  end
end
