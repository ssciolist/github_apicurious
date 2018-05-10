class FollowingCall
  def initialize(current_user)
    @current_user = current_user
  end

  def following
    raw_following = GithubFollowingService.new(@current_user).following
    
    raw_following.map do |raw_user|
      FollowedUser.new(raw_user)
    end
  end
end
