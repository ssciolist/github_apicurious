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
     fork: 'true',
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
      expect(subject.forks).to eq('true')
      expect(subject.creator).to eq('ssciolist')
    end
  end
end
