class Admin::BaseController < ApplicationController
  
  layout 'admin'
  
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to tests_path, alert: 'You are not authtorized to view admin page.' unless current_user.admin?
  end
end