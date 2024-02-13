class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path, notice: "#{user.title} welcome!"
    else
      redirect_to sessions_new_path, notice: "Username and password entered incorrectly!"
    end
  end
end
