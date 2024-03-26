class Admin::BaseController < ApplicationController
  
  layout 'admin'
  
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to tests_path, alert: 'You are not authtorized to view admin page.' unless current_user.is_a?(Admin)
  end
  
  # def admin_required?
  #   if current_user.is_a?(Admin)
  #     redirect_to admin_tests_path
  #   else 
  #     redirect_to tests_path, alert: 'You are not authtorized to view admin page.'
  #   end
  # end
end