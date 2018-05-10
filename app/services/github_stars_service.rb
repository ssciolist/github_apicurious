class GithubStarsService
  def initialize(current_user)
    @current_user = current_user
  end

  def starred_repos
    JSON.parse(raw_search.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com/users/#{@current_user.screen_name}/starred")
  end

  def raw_search
    conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
  end
end
