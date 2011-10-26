module ControllerMacros
  def login_user
    user = Factory.create(:jimmy)
    visit new_user_session_path
    fill_in "Login",    :with => user.username
    fill_in "Password", :with => "stairwaytoheaven"
    click_button "Sign in"

    page.should have_content("Signed in successfully.")
    user
  end
end
