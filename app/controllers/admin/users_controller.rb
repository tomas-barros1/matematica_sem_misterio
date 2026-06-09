module Admin
  class UsersController < BaseController
    def index
      @users = User.order(:name, :email)
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "Usuário atualizado com sucesso."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :role)
    end
  end
end
