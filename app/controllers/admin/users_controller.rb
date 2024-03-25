class Admin::UsersController < ApplicationController

  def destroy
    @user.destroy
    redirect_to admin_tests_path, notice: "User '#{@user.email}' was successfully destroy."
  end

  # private

  # def test_params
  #   params.require(:user).permit(:title, :level, :category_id, :user_id)
  # end

  # def find_user
  #   @user = User.first
  # end

end