class GithubClient < BaseClient
  def initialize
    @http_client = Faraday.new(url: ROOT_ENDPOINT)
  end

  def create_gist(params)
    @last_response = @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{GITHUB_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
    JSON.parse @last_response.body
  end 

  def success? 
    @last_response.status == 201
  end
end
