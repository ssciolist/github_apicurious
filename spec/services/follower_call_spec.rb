require 'rails_helper'

describe FollowerCall do
  let(:user) {user = User.create(screen_name: "ssciolist", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { FollowerCall.new(user)}
  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(FollowerCall)
    end
  end

  context 'instance methods' do
    context 'repositories' do
      it 'returns a collection of repositories' do
        expect(subject.followers.count).to eq(2)
        expect(subject.followers.first).to be_a Follower
      end
    end
  end
end
