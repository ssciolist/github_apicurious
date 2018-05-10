class GithubFollowerService
  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.github.com/users/#{@current_user.screen_name}/followers")
  end

  def response
    @response ||= conn.get do |req|
      req.headers['Authorization'] = "token " + @current_user.oauth_token
    end
  end
end
