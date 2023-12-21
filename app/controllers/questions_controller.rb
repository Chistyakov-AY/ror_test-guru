class QuestionsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  
  def index
    # byebug
    # result = ["Class: #{params.class}","Parameters: #{params.inspect}"]
    # render plain: result.join("\n") 
    
    render plain: 'All questions'
    # render html: '<h1>All tests</h1>'.html_safe
    # render json: { questions: Question.all }
    # render inline: '<p>My favorite language is: <%= %[ybuR].reverse! %>!</p>'
    # render file: 'public/about/author/author.html', layout: false
    # head 204
    # byebug
    # render inline: '<%= console %>' 
  end
  
  def show 
    # byebug
    # redirect_to 'https://ya.ru' 
    # redirect_to new_question_path
    # redirect_to root_path
  end

  def new
    # @question = Question.new
    # redirect_to root_path
    # render plain: 'All questions'
  end

  def create
    # @question = @tests.questions.new(params.require(:question).permit(:body))
    # render plain: question.inspect
    # # result = ["Classs: #{params.class}","Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    question = Question.create(question_params)
    render plain: question.inspect
    byebug

    # result = ["Class: #{params.class}","Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    # Question.create(
    #   body: params[:question][:body],
    #   test_id: params[:question][:test_id]
    # )
  end

  # def destroy
  #   @question = Question.find(params[:id])
  #   @question.destroy
  # end

    # private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
