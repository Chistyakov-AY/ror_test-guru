class Admin::UsersController < Admin::BaseController

  before_action :find_user, only: %i[ show destroy ]

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: t('.success')
  end

  private

  def find_user
    @user = User.find(params[:id])    
  end

  def user_params
    params.require(:user).permit(:title, :level, :category_id, :user_id)
  end

end