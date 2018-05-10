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
    it '#following' do
      VCR.use_cassette('services/github_get_following') do
        followed_users = subject.following
        followed_user = subject.following.first

        expect(followed_user).to have_key(:login)
        expect(followed_user[:login]).to be_a String
        expect(followed_user).to have_key(:avatar_url)
        expect(followed_user[:avatar_url]).to be_a String
        expect(followed_user).to have_key(:html_url)
        expect(followed_user[:html_url]).to be_a String
      end
    end
  end
end
