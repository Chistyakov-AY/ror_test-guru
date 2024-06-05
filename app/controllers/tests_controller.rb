class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start
  
  def index
    @tests = Test.publication
  end

  def start
    if test_without_questions? || question_without_aswers?
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

  def test_without_questions?
    @test.questions.to_a.empty?
  end

  def question_without_aswers?
    result = false
    @test.questions.each { |q|
    result = true if q.answers.to_a.empty?
    }
    return result   
  end
end