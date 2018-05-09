class RepositoryCall
  def initialize(current_user)
    @current_user = current_user
  end

  def repositories
    raw_repos = GithubRepoService.new(current_user).repositories
    
    raw_repos.map do |raw_repo|
      Repository.new(raw_repo)
    end
  end

  private
    attr_reader :current_user
end
