require 'rails_helper'

describe 'user visits their homepage and clicks followers link' do
  it 'they can see a list of their followers' do
    user = User.create(screen_name: "me", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
    # follower = Follower.new({name: "Michael", profile_pic: "www.example.com", screen_name: "Firedog", url: "www.github/user"})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    click_on "Followers"

    expect(current_url).to include("tab=followers")

    expect(page).to have_content(repo.name)
  end
end
