require 'rails_helper'

describe 'User visits their homepage and clicks following link' do
  it 'they can see a list of their repositories' do
    user = User.create(screen_name: 'me', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Following"

    expect(current_url).to include('tab=following')
    expect(page).to have_css(".followed_user", count: 4)
    expect(page).to have_content('ryanpitts')
    within(first('.followed_user')) do
      expect(page).to have_css('.user_full_name')
      expect(page).to have_css('.user_screen_name')
    end
  end
end
