class Repository
  attr_reader :all, :name, :url, :description, :language, :description, :language, :last_updated
  def initialize(attrs)
    @name = attrs[:name]
    @url = attrs[:html_url]
    @description = attrs[:description]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
