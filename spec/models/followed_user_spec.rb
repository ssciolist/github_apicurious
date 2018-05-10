require 'spec_helper'

describe FollowedUser do
  let(:attributes) {
    {name: "ssciolist",
     avatar_url: "example.com",
     html_url: "example.com"}
  }
  subject { FollowedUser.new(attributes)}
  context 'initialize' do
    it 'exists with valid attributes' do
      expect(subject.screen_name).to eq("ssciolist")
      expect(subject.profile_pic).to eq("example.com")
      expect(subject.url).to eq("example.com")
    end
  end
end
