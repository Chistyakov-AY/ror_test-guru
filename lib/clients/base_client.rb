class BaseClient
  attr_reader :http_client

  ROOT_ENDPOINT = 'https://api.github.com'
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']
    
  def initialize
  end

  def create_gist(params)
  end 
end