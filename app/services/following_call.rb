class FollowingCall
  def initialize(current_user)
    @current_user = current_user
  end

  def following
    conn = Faraday.new(url: "https://api.github.com/users/#{@current_user.screen_name}/following")
    response = conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
    # binding.pry
    raw_following = JSON.parse(response.body, symbolize_names: true)
    raw_following.map do |raw_user|
      FollowedUser.new(raw_user)
    end
  end
end
