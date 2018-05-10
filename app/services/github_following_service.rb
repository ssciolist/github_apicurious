class GithubFollowingService
  def initialize(current_user)
    @current_user = current_user
  end

  def following
    JSON.parse(raw_following.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com/users/#{@current_user.screen_name}/following")
  end

  def raw_following
    conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
  end
end
