require 'spec_helper'

describe "watchlists/edit.html.erb" do
  before(:each) do
    @watchlist = assign(:watchlist, stub_model(Watchlist,
      :list_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit watchlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => watchlists_path(@watchlist), :method => "post" do
      assert_select "input#watchlist_list_id", :name => "watchlist[list_id]"
      assert_select "input#watchlist_user_id", :name => "watchlist[user_id]"
    end
  end
end
