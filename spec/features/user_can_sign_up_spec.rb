require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up via navigation bar" do
    visit "/"
    click_link("Sign Up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign Up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "Can sign up via page body button" do
    visit "/"
    click_link("sign_up_button")
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign Up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
