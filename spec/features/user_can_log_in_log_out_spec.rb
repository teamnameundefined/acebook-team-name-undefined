require 'rails_helper'

RSpec.feature "Log in/Log out", type: :feature do


  scenario "Can sign up via navigation bar" do
    visit "/"
    # page.find('#sign_up_button').click
    click_link("Sign Up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign Up"
    expect(current_path).to eq("/")
    click_link("Log Out")
    expect(current_path).to eq("/users/sign_in")
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    check 'user_remember_me'
    click_button "Log In"
    expect(page).to have_content("james@gmail.com")
    expect(current_path).to eq("/")
  end
end
