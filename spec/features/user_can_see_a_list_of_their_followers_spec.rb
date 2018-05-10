require 'rails_helper'

describe 'user visits their homepage and clicks followers link' do
  it 'they can see a list of their followers' do
    VCR.use_cassette('services/get_followers') do
      user = User.create(screen_name: "ssciolist", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path

      click_on "Followers"

      expect(current_url).to include("tab=followers")

      expect(page).to have_content("jamesrnelson")
      expect(page).to have_link("jamesrnelson")
    end
  end
end
