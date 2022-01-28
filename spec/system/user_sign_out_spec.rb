require 'rails_helper'

describe "User signs out", type: :system do
  before do
    user = create :user
    sign_in(user)
  end
  
  scenario "user signs out from dashboard and get taken to homepage" do
    visit dashboard_path
    expect(page).to have_current_path(dashboard_path)
    click_on 'sign-out-link'
    expect(page).to have_text("You have logged out")
    expect(page).to have_current_path(root_path)
  end
end
