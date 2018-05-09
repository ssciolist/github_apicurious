class GithubRepoService
  def initialize(current_user)
    @current_user = current_user
  end

  def repositories
    JSON.parse(raw_repos.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com/user/repos")
  end

  def raw_repos
    conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
  end
end
