require 'spec_helper'

describe "Lists" do
  context "Public list created" do

    it "should be listed on public lists", :js => true do
      login_user

      visit new_list_path

      within("form") do
        fill_in "list_name", :with => "My shiny new list"
        check "list_public"

        page.should have_content("Add new task")
        click_link "add_new_task"
        fill_in "Task name", :with => "Gold"
        click_button "Create List"
      end

      visit lists_path
      within("#lists") do
        page.should have_content("My shiny new list")
        page.should have_content("Gold")
      end
    end
  end
end
