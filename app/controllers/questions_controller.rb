class QuestionsController < ApplicationController

  def index
    # render plain: 'All questions'
    # render html: '<h1>All tests</h1>'.html_safe
    render json: { questions: Question.all }
    # render inline: '<p>My favorite language is: <%= %[ybuR].reverse! %>!</p>'
    # render file: 'public/about/author/author.html', layout: false
    # head 204
    #byebug
    #render inline: '<%= console %>' 
  end

end
