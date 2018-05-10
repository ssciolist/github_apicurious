class StarsCall
  def initialize(current_user)
    @current_user = current_user
  end

  def stars
    raw_stars = GithubStarsService.new(@current_user).starred_repos

    raw_stars.map do |starred_repo|
      Repository.new(starred_repo, true)
    end
  end
end
