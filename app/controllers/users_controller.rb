class UsersController < ApplicationController

  skip_before_action :authenticate_user!

  def new 
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: "User '#{@user.title}' was successfully created."
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User '#{@user.title}' was successfully destroy."
  end

  private

  def user_params
    params.require(:user).permit(:title, :email, :password, :password_confirmation)
  end
end
