require 'rails_helper'

describe GithubRepoService do
  let(:user) { user = User.create(screen_name: "ssciolist", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN']) }
  subject { GithubRepoService.new(user) }
  context 'initialize' do
    it 'exists' do
      expect(subject).to be_a GithubRepoService
    end
  end

  context 'instance methods' do
    context '#repositories' do
      it 'returns array of repository hashes' do
        VCR.use_cassette('services/githhub_get_repos') do
          repositories = subject.repositories
          repository = subject.repositories.first
          repository2 = subject.repositories.last

          expect(repositories).to be_an Array
          expect(repositories.count).to eq(30)

          expect(repository).to have_key(:name)
          expect(repository[:name]).to be_a String
          expect(repository).to have_key(:html_url)
          expect(repository[:html_url]).to be_a String
          expect(repository).to have_key(:description)
          expect(repository[:description]).to be_nil
          expect(repository2[:description]).to be_a String
          expect(repository).to have_key(:language)
          expect(repository[:language]).to be_a String
          expect(repository).to have_key(:updated_at)
          expect(repository[:updated_at]).to be_a String
        end
      end
    end
  end
end
