require 'spec_helper'

def login(strategy = :username)
  visit root_path
  click_link "login"

  if strategy == :username
    fill_in "Login", :with => user.username
  elsif strategy == :email
    fill_in "Login", :with => user.email
  end

  fill_in "Password", :with => password
  click_button "Sign in"
end

def check_successful_login
  page.should have_content("Signed in successfully.")
  page.should have_xpath("//a", :text => "account")
  page.should have_xpath("//a", :text => "logout")
end

describe "Login process" do
  let(:password) { "secretpass" }
  let(:user) { Factory(:jamis, :password => password, :password_confirmation => password) }

  context "signing in as a guest with valid credentials" do
    it "prompts a welcoming message when using username" do
      login(:username)
      check_successful_login
    end

    it "prompts a welcoming message when using email" do
      login(:email)
      check_successful_login
    end
  end

  context "signing out" do
    before { login(:email) }

    it "shows login link and a successful logout message" do
      click_link "logout"
      page.should have_content("Signed out successfully.")
      page.should have_xpath("//a", :text => "login")
    end
  end
end
