require 'spec_helper'

describe "watchlists/new.html.erb" do
  before(:each) do
    assign(:watchlist, stub_model(Watchlist,
      :list_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new watchlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => watchlists_path, :method => "post" do
      assert_select "input#watchlist_list_id", :name => "watchlist[list_id]"
      assert_select "input#watchlist_user_id", :name => "watchlist[user_id]"
    end
  end
end
