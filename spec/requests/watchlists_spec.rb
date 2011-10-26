require 'spec_helper'

describe "Watchlists" do
  describe "GET /user/watchlists" do
    it "works! (now write some real specs)", :js => true do
      login
      visit user_watchlists_path
      response.should be_successful
    end
  end
end
