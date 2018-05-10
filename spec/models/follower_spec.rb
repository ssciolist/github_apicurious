require 'spec_helper'

describe Follower do
  let(:attributes) {
    {login: "ssciolist",
     avatar_url: "example.com",
     html_url: "example.com"}
  }
  subject { Follower.new(attributes)}
  context 'initialize' do
    it 'exists with valid attributes' do
      expect(subject.screen_name).to eq("ssciolist")
      expect(subject.profile_pic).to eq("example.com")
      expect(subject.url).to eq("example.com")
    end
  end
end
