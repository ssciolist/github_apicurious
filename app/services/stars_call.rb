class StarsCall
  def initialize(current_user)
    @current_user = current_user
  end

  def stars
    raw_stars = GithubStarsService.new(@current_user).stars

    raw_stars.map do |starred_repo|
      StarredRepository.new(starred_repo)
    end
  end
end
