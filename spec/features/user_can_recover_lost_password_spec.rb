require 'rails_helper'

RSpec.feature "Recover password", type: :feature do

  before(:all) do
    Capybara.current_driver = :selenium
  end
  after(:all) do
    Capybara.use_default_driver
  end

  scenario "Can change password" do
    assert ActionMailer::Base.deliveries.empty?
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    click_link "Log out"
    click_link "Forgot your password?"
    fill_in "user_email", with: "james@gmail.com"
    click_button "Send me reset password instructions"
    expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
    expect(current_path).to eq("/users/sign_in")
    assert !ActionMailer::Base.deliveries.empty?
  end

  scenario "Can change password" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    click_link "Log out"
    click_link "Forgot your password?"
    fill_in "user_email", with: "j@gmail.com"
    click_button "Send me reset password instructions"
    expect(page).to have_content("Email not found")
    expect(current_path).to eq("/users/password")
  end
end
