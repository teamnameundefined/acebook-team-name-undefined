require 'rails_helper'



RSpec.feature "Posts", type: :feature do

  before(:all) do
    Capybara.current_driver = :selenium
  end

  after(:all) do
    Capybara.use_default_driver
  end

  scenario "Can preserve line breaks in posts" do
    visit "/"
    click_link("Sign Up", match: :first)
    fill_in "user_email", with: "james@gmail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign Up"
    visit "/posts"
    click_link "New post"
    page.driver.browser.find_element(:id, "post_message").send_keys("Hello, world! What is up?")
    page.driver.browser.find_element(:id, "post_message").send_keys(:enter)
    page.driver.browser.find_element(:id, "post_message").send_keys("THOMAS THOMAS THOMAS")
    click_button("Submit")
    page.save_screenshot('doubleEnter.png', full: true)
    expect(current_path).to eq("/posts")
    expect(page).to have_content('Hello, world! What is up?')
    expect(page).to have_content('THOMAS THOMAS THOMAS')
    expect(page.html).to include("<p>Hello, world! What is up?")
    expect(page.html).to include("<br>THOMAS THOMAS THOMAS</p>")
  end
end
