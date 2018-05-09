class WelcomeController < ApplicationController
  def index
    if params[:tab] == "repositories"
      call = RepositoryCall.new(current_user)
      call.repositories
      @repositories = Repository.all
    end
  end

end
