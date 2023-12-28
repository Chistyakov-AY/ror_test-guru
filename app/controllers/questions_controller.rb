class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  
  def index
    @questions = Question.all
    render plain: @test.questions.inspect
  end
  
  def show
    render plain: @question.inspect
  end

  def new

  end

  def create
    @question = @test.questions.create(question_params)

    if @question.save
      render inline: '<p>Вопрос: <%= @question.inspect %>!</p> добавлен!'
    else
      render inline: '<p>Ошибка: <%= @question.errors.inspect %>!</p>'
    end
  end

  def destroy
    @question.destroy
  end

  private
  
  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])    
  end 

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
