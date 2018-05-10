require 'rails_helper'

describe 'User visits their homepage and clicks stars' do
  scenario 'they see a list of the repos they starred' do
    VCR.use_cassette('services/get_starred_repos') do
      user = User.create(screen_name: 'ssciolist', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      click_on "Stars"

      expect(current_url).to include('tab=stars')

      save_and_open_page
      expect(page).to have_css(".starred_repo", count: 5)
      expect(page).to have_content('Resources for teaching Python for Data Wrangling at NICAR 2016.')
      within(first('.starred_repo')) do
        expect(page).to have_css('.repo_link')
        expect(page).to have_css('.repo_description')
        expect(page).to have_css('.repo_language')
        expect(page).to have_css('.repo_stars')
        expect(page).to have_css('.repo_forks')
        expect(page).to have_css('.repo_updated_at')
      end
    end
  end
end
