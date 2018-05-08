class WelcomeController < ApplicationController
  def index
    @repositories = Repository.all if params[:tab] == "repositories"
  end

end
