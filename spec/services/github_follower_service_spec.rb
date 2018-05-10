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
        followers = subject.followers
        follower = subject.followers.first

        expect(followers).to be_an Array
        expect(followers.count).to eq(1)

        expect(follower).to have_key(:screen_name)
        expect(follower[:screen_name]).to be_a String
        expect(follower).to have_key(:profile_pic)
        expect(follower[:profile_pic]).to be_a String
        expect(follower).to have_key(:url)
        expect(follower[:url]).to be_a String
      end
    end
  end
end
