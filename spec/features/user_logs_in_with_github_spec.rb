require 'rails_helper'

describe 'user logs in using Github' do
  scenario 'they log in and see the homepage with their name' do
    user = User.create(screen_name: "me", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    expect(page).to have_link('Login')
    click_link 'Login'
    expect(page).to have_content('ssciolist')
    expect(page).to have_link('Logout')
  end

  scenario 'they can log in and log out' do
    user = User.create(screen_name: "me", oauth_token: ENV['GITHUB_AUTHORIZATION_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    expect(page).to have_link('Login')
    click_link 'Login'
    click_link 'Logout'
    expect(page).to_not have_content('ssciolist')
  end

end
