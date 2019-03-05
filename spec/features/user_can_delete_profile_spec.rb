require 'rails_helper'

RSpec.feature "Edit profile", type: :feature do

  before(:all) do
    Capybara.current_driver = :selenium
  end
  after(:all) do
    Capybara.use_default_driver
  end


  scenario "Can delete account" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/"

    click_link("Edit profile")
    expect(current_path).to eq("/users/edit")
    click_button "Cancel my account"
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(current_path).to eq("/users/sign_in")
    fill_in "user_email", with: "1234@gmail.com"
    fill_in "user_password", with: "password"
    click_button "Log in"
    expect(current_path).to eq("/users/sign_in")
    expect(page).to have_content("Invalid Email or password")
  end
end
