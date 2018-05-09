require 'spec_helper'

describe Repository do
  let (:attributes) {
    {name: 'HelloRepo',
     html_url: 'example.com',
     description: 'this is a repo',
     language: 'Ruby',
     updated_at: "#{Date.today}"
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
    end
  end
end
