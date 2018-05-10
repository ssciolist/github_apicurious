class FollowerCall
  def initialize(current_user)
    @current_user = current_user
  end

  def followers
    raw_followers = GithubFollowerService.new(@current_user).followers

    raw_followers.map do |raw_follower|
      Follower.new(raw_follower)
    end
  end
end
