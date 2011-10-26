require 'spec_helper'

describe "user registration" do
  it "allows new users to register with an username, an email address and password" do
    visit new_user_registration_path

    fill_in "Username",              :with => "myusername"
    fill_in "Email",                 :with => "my@mail.com"
    fill_in "Password",              :with => "secretpass"
    fill_in "Password confirmation", :with => "secretpass"

    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")
    User.count.should == 1
  end

  it "allows a registered user to cancel it's account" do
    user = Factory(:jimmy)

    visit new_user_session_path
    fill_in "Login",    :with => "jimmy"
    fill_in "Password", :with => "stairwaytoheaven"
    click_button "Sign in"

    delete registration_path(user)
    page.should have_content("Bye! Your account was successfully cancelled. We hope to see you again soon.")
    User.count.should == 0
  end
end
