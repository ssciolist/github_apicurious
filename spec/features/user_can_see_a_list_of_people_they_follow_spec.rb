require 'rails_helper'

describe 'User visits their homepage and clicks following link' do
  it 'they can see a list of their repositories' do
    user = User.create(screen_name: 'me', oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Following"

    expect(current_url).to include('tab=following')
    expect(page).to have_content('python-data-wrangling')
  end
end
