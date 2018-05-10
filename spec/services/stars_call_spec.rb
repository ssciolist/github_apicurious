require 'rails_helper'

describe StarsCall do
  let(:user) {user = User.create(screen_name: "ssciolist", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { StarsCall.new(user)}
  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(StarsCall)
    end
  end

  context 'instance methods' do
    context '#stars' do
      it 'returns a collection of starred repositories' do

      end
    end
  end
end
