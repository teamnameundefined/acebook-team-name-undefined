require 'rails_helper'

RSpec.feature "Sign Up Errors", type: :feature do
  scenario "Throw error if password too short" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "pass"
    fill_in "user_password_confirmation", with: "pass"
    click_button "Sign up"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "Throw error if email is blank" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_password", with: "pass"
    fill_in "user_password_confirmation", with: "pass"
    click_button "Sign up"
    expect(page).to have_content("Email can't be blank")
  end

  scenario "Throw error if both password fields left blank" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    click_button "Sign up"
    expect(page).to have_content("Password can't be blank")
  end

  scenario "Throw error if passwords don't match" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password1234"
    fill_in "user_password_confirmation", with: "thomas1234"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
