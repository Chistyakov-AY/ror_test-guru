class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    
    client = GithubOctokitClient.new
    service = GistQuestionService.new(@test_passage.current_question, client: client)
    result = service.call

    if service.success?
      current_user.gists.create(question_id: @test_passage.current_question.id, url: result['html_url'])
      redirect_to @test_passage, notice: t('.success', url: result['html_url']).html_safe
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end
end