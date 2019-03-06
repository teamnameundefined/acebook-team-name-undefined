require 'rails_helper'

RSpec.feature "Edit profile", type: :feature do

  before(:all) do
    Capybara.current_driver = :selenium
  end
  after(:all) do
    Capybara.use_default_driver
  end

  scenario "Can delete account" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    click_link("Edit profile")
    expect(current_path).to eq("/users/edit")
    click_button "Cancel my account"
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(current_path).to eq("/users/sign_in")
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    click_button "Log in"
    expect(current_path).to eq("/users/sign_in")
    expect(page).to have_content("Invalid Email or password")
  end
end
