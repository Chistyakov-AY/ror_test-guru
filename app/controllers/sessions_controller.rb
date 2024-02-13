class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path, notice: "#{user.title} welcome to Projekt 'TestGuru'!"
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please' # не отобажается красная рамка!!!
      render :new
    end
  end
end
