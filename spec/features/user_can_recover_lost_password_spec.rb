require 'rails_helper'

RSpec.feature "Recover password", type: :feature do

  before(:all) do
    Capybara.current_driver = :selenium
  end
  after(:all) do
    Capybara.use_default_driver
  end

  before :each do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  scenario "Can change password" do
    assert ActionMailer::Base.deliveries.empty?

    # user = FactoryBot.create(:user)
    # login_as(user, :scope => :user)
    visit "/"

    click_link "Log Out"
    click_link "Forgot your password?"
    fill_in "user_email", with: "1234@gmail.com"
    click_button "Send Recovery Link"
    expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
    expect(current_path).to eq("/users/sign_in")
    assert !ActionMailer::Base.deliveries.empty?
  end

  scenario "Can't change password if wrong email entered" do
    visit "/"

    click_link "Log Out"
    click_link "Forgot your password?"
    fill_in "user_email", with: "j@gmail.com"
    click_button "Send Recovery Link"
    expect(page).to have_content("Email not found")
    expect(current_path).to eq("/users/password")
  end
end
