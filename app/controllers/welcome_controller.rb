class WelcomeController < ApplicationController
  def index
    if params[:tab] == "repositories"
      RepositoryCall.new(current_user).repositories
      @repositories = Repository.all
    elsif params[:tab] == "followers"
      FollowerCall.new(current_user).followers
      @followers = Follower.all
    elsif params[:tab] == "following"
      FollowingCall.new(current_user).following
      @following = FollowedUser.all
    end
  end

end
