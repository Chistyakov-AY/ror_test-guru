class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']
    
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @last_response = @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{GITHUB_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
    success? ? JSON.parse(@ast_response.body) : {}
  end

  def success?
    @last_response.status == 201
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end