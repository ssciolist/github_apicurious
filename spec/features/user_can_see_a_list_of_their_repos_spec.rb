require 'rails_helper'

describe 'user visits their homepage and clicks repositories link' do
  it 'they can see a list of their repositories' do
    VCR.use_cassette('services/get_repos') do
      user = User.create(screen_name: "ssciolist", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      click_on "Repositories"

      expect(current_url).to include("tab=repositories")
      expect(page).to have_content("active-record-obstacle-course")
    end
  end
end
