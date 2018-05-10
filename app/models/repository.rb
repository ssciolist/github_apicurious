class Repository
  attr_reader :all, :name, :url, :description, :language, :description, :language, :last_updated, :stars, :stars_url, :forks
  def initialize(attrs)
    @name = attrs[:name]
    @url = attrs[:html_url]
    @description = attrs[:description]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
    @stars = attrs[:stargazers_count]
    @stars_url = attrs[:stargazers_url]
    @forks = attrs[:fork]

  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
