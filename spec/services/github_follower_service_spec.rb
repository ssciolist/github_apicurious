require 'rails_helper'

describe GithubFollowerService do
  let(:user) { User.create(screen_name: 'ssciolist', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject {GithubFollowerService.new(user)}

  context 'initialize' do
    it 'exists' do
      expect(subject).to be_a GithubFollowerService
    end
  end

  context 'instance methods' do
    context '#followers' do
      it 'returns array of follower hashes' do
        VCR.use_cassette('services/github_get_followers') do
          followers = subject.followers
          follower = subject.followers.first

          expect(followers).to be_an Array
          expect(followers.count).to eq(2)

          expect(follower).to have_key(:login)
          expect(follower[:login]).to be_a String
          expect(follower).to have_key(:avatar_url)
          expect(follower[:avatar_url]).to be_a String
          expect(follower).to have_key(:html_url)
          expect(follower[:html_url]).to be_a String
        end
      end
    end
  end
end
