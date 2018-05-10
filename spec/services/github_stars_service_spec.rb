require 'rails_helper'

describe GithubStarsService do
  let(:user) { user = User.create(screen_name: 'ssciolist', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])}
  subject { GithubStarsService.new(user) }

  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(GithubStarsService)
    end
  end

  context 'instance methods' do
    context '#starred_repos' do
      it 'returns array of starred repos' do
        VCR.use_cassette('services/github_get_starred_repos') do
          starred_repos = subject.starred_repos
          starred_repo = subject.starred_repos.first

          expect(starred_repos).to be_an Array
          expect(starred_repos.count).to eq(5)

          expect(starred_repo).to have_key(:owner)
          expect(starred_repo).to have_key(:name)
          expect(starred_repo).to have_key(:description)
          expect(starred_repo).to have_key(:language)
          expect(starred_repo).to have_key(:updated_at)
          expect(starred_repo).to have_key(:stargazers_count)
          expect(starred_repo).to have_key(:stargazers_url)
          expect(starred_repo).to have_key(:forks_count)
        end
      end
    end
  end
end
