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

    it "should not allow lists from same user with equal names" do
      user = Factory(:jamis)
      list_attributes = Factory.attributes_for(:xmas_list)
      xmas_list = user.lists.build(list_attributes)
      private_xmas_list = user.lists.build(list_attributes.update(public: false))

      xmas_list.save.should be_true
      private_xmas_list.save.should be_false
      private_xmas_list.errors[:name].should == ["has already been taken"]
    end
  end

  context "validate associations" do
    it "should destroy all its tasks upon destruction" do 
      list = Factory.create(:groceries_list)
      items = ["apples", "oranges", "pork", "icecream"]
      items.each do |item|
        list.tasks.create!(name: item)
      end

      Task.count.should == items.length
      list.destroy
      Task.count.should == 0
    end
  end

  context "attributes behaviour" do
    it "should return whether a list is private or not" do
      public_list = Factory.create(:groceries_list, public: true)
      private_list = Factory.create(:groceries_list, name: "2nd groceries' list", public: false)

      public_list.private?.should be_false
      private_list.private?.should be_true
    end
  end
end
