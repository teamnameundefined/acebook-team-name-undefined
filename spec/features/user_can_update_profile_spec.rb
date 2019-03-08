require 'rails_helper'

RSpec.feature "Edit user", type: :feature do
  scenario "Can change email" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/"

    click_link("Edit profile")
    fill_in "user_email", with: "jpr@gmail.com"
    fill_in "user_current_password", with: "password"
    click_button "Update"
    expect(page).to have_content("jpr@gmail.com")
    expect(current_path).to eq("/")
  end

  scenario "Can change password" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/"

    click_link("Edit profile")
    fill_in "user_password", with: "123password"
    fill_in "user_password_confirmation", with: "123password"
    fill_in "user_current_password", with: "password"
    click_button "Update"
    click_link "Log Out"
    fill_in "user_email", with: "1234@gmail.com"
    fill_in "user_password", with: "123password"
    click_button "Log In"
    expect(page).to have_content("1234@gmail.com")
    expect(current_path).to eq("/")
  end

  scenario "Can go back from edit to last page" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/"

    click_link("Edit profile")
    click_link "Back"
    expect(page).to have_content("1234@gmail.com")
    expect(current_path).to eq("/")
  end
end
