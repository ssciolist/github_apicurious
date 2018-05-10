class Repository
  attr_reader :all, :name, :url, :description, :language, :description,
              :language, :last_updated, :stars, :stars_url, :forks, :starred, :creator

  def initialize(attrs, starred = false)
    @name = attrs[:name]
    @url = attrs[:html_url]
    @description = attrs[:description]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
    @stars = attrs[:stargazers_count]
    @stars_url = attrs[:stargazers_url]
    @forks = attrs[:fork]
    @starred = starred
    @creator = attrs[:owner][:login]
  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.starred
    ObjectSpace.each_object(self).to_a.find_all{ |x| x.starred == true}
  end
end
