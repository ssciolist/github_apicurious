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
    elsif params[:tab] == "stars"
      StarsCall.new(current_user).stars
      @starred_repos = Repository.all
    end
  end

end
