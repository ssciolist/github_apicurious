class RepositoryCall
  def repositories
    conn = Faraday.new(url: "https://api.github.com/user/repos")
    conn.post do |req|
      req.headers['Authorization'] = ENV['GITHUB_AUTHORIZATION_TOKEN']
    end
  end
end
