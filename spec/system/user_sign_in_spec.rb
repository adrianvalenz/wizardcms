require 'rails_helper'

describe "User login flow", type: :system do
  scenario "user goes to log in page" do
    visit root_path
    click_on "sign-in-link"

    page_title = find("h1#page-title")
    expect(page_title).to have_content("Login")
  end

  scenario "user fills out form and signs in" do
    user = create :user

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "secret"
    click_on "sign-in-button"

    expect(page).to have_content(user.email)
    expect(page).to have_text('You have logged in successfully')
  end
end
