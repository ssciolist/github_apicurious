class ForksController < ApplicationController
  def show
    repository_name = params[:repository]
    repository_creator = params[:creator]

    ForkCall.new(current_user, repository_name, repository_creator).forks
    @forked_repositories = Repository.forked
  end
end
