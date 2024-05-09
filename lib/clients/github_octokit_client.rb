class GithubOctokitClient < BaseClient

  def initialize
    @http_client = Octokit::Client.new(access_token: BaseClient::GITHUB_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def success?
    @http_client.last_response.status == 201
  end
end

