require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ListsHelper. For example:
#
# describe ListsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ListsHelper do
  it "should return whether the list is public or private" do
    public_list = Factory(:groceries_list)
    private_list = Factory(:groceries_list, :public => false)

    helper.public_list?(public_list).should == "public"
    helper.public_list?(private_list).should == "private"
  end

  it "should return a cycle object for iterables but string, retuning the very string object" do
    helper.cycle_on_iterable(["a", "b"]).should == "a"
    helper.cycle_on_iterable(["a", "b"]).should == "b"
    helper.cycle_on_iterable("self").should == "self"
  end
end
