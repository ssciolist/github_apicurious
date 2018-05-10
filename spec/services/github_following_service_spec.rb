require 'rails_helper'

describe GithubFollowingService do
  let(:user) { User.create(screen_name: 'ssciolist', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { GithubFollowingService.new(user) }

  context 'initialize' do
    it 'exists' do
      expect(subject).to be_a GithubFollowingService
    end
  end

  context 'instance methods' do
    skip '#following' do
      followed_users = subject.following
      followed_user = subject.following.first

      expect(follower).to have_key(:login)
      expect(follower[:login]).to be_a String
    end
  end
end
