class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def update
    if @test_passage.answer_selected?(params[:answer_ids])
      flash.now[:alert] = t('.no_answer_selected')
      render :show
    else
      @test_passage.accept!(params[:answer_ids])
    
      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else 
        render :show
      end
    end
  end

private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end