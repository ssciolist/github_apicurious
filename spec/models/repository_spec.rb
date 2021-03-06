require 'spec_helper'

describe Repository do
  let (:attributes) {
    {name: 'HelloRepo',
     html_url: 'example.com',
     description: 'this is a repo',
     language: 'Ruby',
     updated_at: "#{Date.today}",
     stargazers_count: 3,
     stargazers_url: 'example.com',
     forks_count: 5,
     owner: {
       login: 'ssciolist'
     }
    }
  }
  subject { Repository.new(attributes)}

  context 'initialize' do
    it 'exists with valid attributes' do
      expect(subject.name).to eq('HelloRepo')
      expect(subject.url).to eq('example.com')
      expect(subject.description).to eq('this is a repo')
      expect(subject.language).to eq('Ruby')
      expect(subject.last_updated).to eq("#{Date.today}")
      expect(subject.stars).to eq(3)
      expect(subject.stars_url).to eq("example.com")
      expect(subject.forks).to eq(5)
      expect(subject.creator).to eq('ssciolist')
    end

    it 'can be starred' do
      starred_repo = Repository.new(attributes, true)

      expect(starred_repo.starred).to eq(true)
    end
  end
end
