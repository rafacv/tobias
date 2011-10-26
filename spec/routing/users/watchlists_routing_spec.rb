require "spec_helper"

describe Users::WatchlistsController do
  describe "routing" do

    it "routes to #index" do
      get("/user/watchlists").should route_to("users/watchlists#index")
    end

    it "routes to #create" do
      post("/user/watchlists").should route_to("users/watchlists#create")
    end

    it "routes to #destroy" do
      delete("/user/watchlists/1").should route_to("users/watchlists#destroy", :id => "1")
    end

  end
end
