class GithubForkService
  def initialize(current_user, repository_name, repository_creator)
    @current_user = current_user
    @repository_name = repository_name
    @repository_creator = repository_creator
  end

  def forks
    JSON.parse(raw_forks.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com/repos/#{@repository_creator}/#{@repository_name}/forks")
  end

  def raw_forks
    conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
  end
end
