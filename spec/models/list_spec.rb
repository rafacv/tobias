require 'spec_helper'

describe List do
  context "validations" do
    it "should not allow orphan lists" do
      list = Factory.build(:xmas_list, :user_id => nil)
      list.save.should be_false
      list.errors[:user_id].should == ["can't be blank"]
    end

    it "should not allow lists without a name" do
      list = Factory.build(:todo_list, :name => "")
      list.save.should be_false
      list.errors[:name].should == ["can't be blank"]
    end
  end
end
