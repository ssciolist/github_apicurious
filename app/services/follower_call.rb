class FollowerCall
  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    GithubFollowerService.new(@current_user).followers

    conn = Faraday.new(url: "https://api.github.com/users/#{@current_user.screen_name}/followers")
    response = conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
    raw_followers = JSON.parse(response.body, symbolize_names: true)
    raw_followers.map do |raw_follower|
      Follower.new(raw_follower)
    end
  end
end
