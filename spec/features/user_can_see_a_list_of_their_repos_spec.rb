require 'rails_helper'

describe 'user visits their homepage and clicks repositories link' do
  describe 'they can see a list of their repositories' do
    visit root_path

    click_on "Repositories"

    expect(current_url).to include("tab=repositories")

    expect(page).to have_content("rails_engine")
    expect(page).to have_content("denver-building-permit-scraper")
  end
end
