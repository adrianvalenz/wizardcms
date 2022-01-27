require 'rails_helper'

describe "User registers account", type: :system do
  let(:user) { create :user }

  scenario "user registers and sees dashboard" do
    visit login_path
    click_link 'register-user'

    email = Faker::Internet.email
    password = Faker::Internet.password
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "submit-register-user"

    expect(page).to have_text("You have registered successfully")

    page_title = find('h1#page-title')
    expect(page_title).to have_content("Dashboard")
    expect(page).to have_content(email)
  end
end
