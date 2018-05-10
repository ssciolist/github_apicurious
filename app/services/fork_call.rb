class ForkCall
  def initialize(current_user, repository_name, repository_creator)
    @current_user = current_user
    @repository_name = repository_name
    @repository_creator = repository_creator
  end

  def forks
    raw_forks = GithubForkService.new(@current_user, @repository_name, @repository_creator).forks

    raw_forks.map do |raw_repo|
      Repository.new(raw_repo, false, true)
    end
  end
end
