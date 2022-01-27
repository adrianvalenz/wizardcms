require 'rails_helper'

describe "User session flow", type: :system do
  scenario "redirected from dashboard when logged out" do
    visit "/dashboard"
    expect(page).to have_text("You must log in")
    page_title = find('h1#page-title')
    expect(page_title).to have_content("Login")
    expect(page).to have_no_content('Dashboard')
  end

  scenario "user clicks register account" do
    visit dashboard_path
    expect(page).to have_content("Don't have an account?")
    click_link "register-user"
    page_title = find('h1#page-title')
    expect(page_title).to have_content("Register")
  end
end
