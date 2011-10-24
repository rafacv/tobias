require 'spec_helper'

describe Watchlist do
  context "validations" do
    it "should not be allowed for a user to watch one of her lists" do
      todo_list = Factory(:todo_list)
      user = todo_list.user
      watchlist = Watchlist.new(:user_id => user.id, :list_id => todo_list.id)

      watchlist.save.should be_false
      watchlist.errors[:base].should == ["List owner cannot add it to watchlist"]
    end

    it "should not be allowed to watch private lists" do
      list_owner = Factory(:jimmy)
      xmas_list = Factory(:xmas_list, :user_id => list_owner.id)
      user = Factory(:jamis)
      watchlist = Watchlist.new(:user_id => user.id, :list_id => xmas_list.id)

      watchlist.save.should be_false
      watchlist.errors[:base].should == ["Private list cannot be watched"]
    end
  end
end
