class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start
  
  def index
    @tests = Test.publication
  end

  def start
    if @test.questions.empty?
      redirect_to tests_path, alert: t('.without_question')
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

private

  def find_test
    @test = Test.find(params[:id])    
  end
end