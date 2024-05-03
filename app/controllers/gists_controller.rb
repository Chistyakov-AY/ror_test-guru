class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[create]

  def create
    client = Octokit::Client.new(access_token: GitHubClient::GITHUB_TOKEN)
    service = GistQuestionService.new(@test_passage.current_question, client:)
    result = service.call

    if service.success?
      redirect_to @test_passage, notice: t('.success', url: result[:html_url]).html_safe
      Gist.create(user_id: current_user.id, question_id: @test_passage.current_question.id, url: result[:html_url].html_safe)
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end