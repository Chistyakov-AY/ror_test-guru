class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    client = Octokit::Client.new(access_token: GitHubClient::GITHUB_TOKEN)
    service = GistQuestionService.new(@test_passage.current_question, client: client)
    result = service.call

    if service.success?
      current_user.gists.create(user_id: :id, question_id: @test_passage.current_question.id, url: result['html_url'].html_safe)
      redirect_to @test_passage, notice: t('.success', url: result['html_url']).html_safe
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end
end
