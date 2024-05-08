class GitHubClient
  attr_reader :http_client

  ROOT_ENDPOINT = 'https://api.github.com'
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']
    
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{GITHUB_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end 

  def success?
    @status == 201
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end