require 'rails_helper'

describe GithubStarsService do
  let(:user) { user = User.create(screen_name: 'ssciolist', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { GithubStarsService.new(user) }

  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(GithubStarsService)
    end
  end
end
