class RepositoryCall
  def initialize(current_user)
    @current_user = current_user
  end

  def repositories
    conn = Faraday.new(url: "https://api.github.com/user/repos")
    response = conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
    raw_repos = JSON.parse(response.body, symbolize_names: true)
    raw_repos.map do |raw_repo|
      Repository.new(raw_repo)
    end
  end
end
