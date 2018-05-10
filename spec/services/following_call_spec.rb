require 'rails_helper'

describe FollowingCall do
  let(:user) {user = User.create(screen_name: "ssciolist", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { FollowingCall.new(user)}
  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(FollowingCall)
    end
  end

  context 'instance methods' do
    context 'repositories' do
      it 'returns a collection of repositories' do
        expect(subject.following.count).to eq(5)
        expect(subject.following.first).to be_a FollowedUser
      end
    end
  end
end
