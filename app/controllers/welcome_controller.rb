class WelcomeController < ApplicationController
  def index
    if params[:tab] == "repositories"
      call = RepositoryCall.new(current_user)
      call.repositories
      @repositories = Repository.all
    else params[:tab] == "followers"
      call = FollowerCall.new(current_user)
      call.followers
      @followers = Follower.all
    end
  end

end
