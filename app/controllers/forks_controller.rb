class ForksController < ApplicationController
  def show
    repository_name = params[:repository_name]
    repository_creator = params[:repository_creator]

    ForkCall.new(current_user, repository_name, repository_creator).forks
    @forked_repositories = Repository.find_by_name(repository_name)
  end
end
