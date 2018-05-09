class Follower
  attr_reader :all, :name, :url, :description, :language, :description, :language, :last_updated
  def initialize(attrs)
    binding.pry
    @screen_name = attrs[:name]
    @profile_pic = attrs[:avatar_url]
    @url = attrs[:html_url]
  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
