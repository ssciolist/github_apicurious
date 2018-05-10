class Follower
  attr_reader :all, :screen_name, :profile_pic, :url
  def initialize(attrs)
    @screen_name = attrs[:login]
    @profile_pic = attrs[:avatar_url]
    @url = attrs[:html_url]
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
