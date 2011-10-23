require 'spec_helper'

describe Task do
  context "validations" do
    # it "should not be listless" do
    #   task = Factory.build(:xmas_gifts_task, :list_id => nil)
    #   task.save.should be_false
    #   task.errors[:list_id].should == ["can't be blank"]
    # end

    it "should have a name" do
      task = Factory.build(:buy_wine_task, :name => "")
      task.save.should be_false
      task.errors[:name].should == ["can't be blank"]
    end

    it "should not have the duplicated name within same list" do
      list = Factory(:groceries_list)
      task1 = list.tasks.build(name: "apples", finished: true)
      task2 = list.tasks.build(name: "apples", finished: true)
      task3 = list.tasks.build(name: "apples", finished: false)

      task1.save.should be_true
      task2.save.should be_false
      task2.errors[:name].should == ["has already been taken"]
      task3.save.should be_false
      task3.errors[:name].should == ["has already been taken"]
    end
  end
end
