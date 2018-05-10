class Repository
  attr_reader :all, :name, :url, :description, :description,
              :language, :last_updated, :stars, :stars_url, :forks, :starred, :creator, :forked

  def initialize(attrs, starred = false, forked = false)
    @name = attrs[:name]
    @url = attrs[:html_url]
    @description = attrs[:description]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
    @stars = attrs[:stargazers_count]
    @stars_url = attrs[:stargazers_url]
    @forks = attrs[:forks_count]
    @starred = starred
    @creator = attrs[:owner][:login]
    @forked = forked
  end


  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.starred
    ObjectSpace.each_object(self).to_a.find_all{ |x| x.starred == true}
  end

  def self.forked
    ObjectSpace.each_object(self).to_a.find_all{ |x| x.forked == true}
  end

  def self.find_by_name(name)
    ObjectSpace.each_object(self).to_a.find_all{ |x| x.name == name}
  end
end
