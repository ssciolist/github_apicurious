require 'rails_helper'

describe RepositoryCall do
  let(:user) {user = User.create(screen_name: "me", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { RepositoryCall.new(user)}
  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(RepositoryCall)
    end
  end

  context 'instance methods' do
    context 'repositories' do
      it 'returns a collection of repositories' do
        expect(subject.repositories.count).to eq(30)
        expect(subject.repositories.first).to be_a Repository
      end
    end
  end
end
