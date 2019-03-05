require 'rails_helper'

RSpec.feature "Edit user", type: :feature do
  scenario "Can change email" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    click_link("Edit profile")
    fill_in "user_email", with: "jpr@gmail.com"
    fill_in "user_current_password", with: "password123"
    click_button "Update"
    expect(page).to have_content("Logged in as jpr@gmail.com")
    expect(current_path).to eq("/")
  end

  scenario "Can change password" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    click_link("Edit profile")
    fill_in "user_password", with: "123password"
    fill_in "user_password_confirmation", with: "123password"
    fill_in "user_current_password", with: "password123"
    click_button "Update"
    click_link "Log out"
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "123password"
    click_button "Log in"
    expect(page).to have_content("Logged in as james@gmail.com")
    expect(current_path).to eq("/")
  end

  scenario "Can go back from edit to last page" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    click_link("Edit profile")
    click_link "Back"
    expect(page).to have_content("Logged in as james@gmail.com")
    expect(current_path).to eq("/")
  end
end
