require 'spec_helper'

describe User do
  let(:user) { Factory.build(:bob) }

  context "validation" do
    it "should not allow users without username" do
      user.username = ""
      user.save.should be_false
      user.should be_invalid
      user.errors[:username].should == ["can't be blank"]
    end

    it "should not allow users without email" do
      user.email = ""
      user.save.should be_false
      user.should be_invalid
      user.errors[:email].should == ["can't be blank"]
    end
  end

  context "validate associations" do
    it "should destroy all its list upon destruction" do
      user = Factory(:jamis)
      number_of_lists = 3
      1.upto(number_of_lists) do |n|
        user.lists.create!(name: "my list #{n}")
      end

      List.count.should == number_of_lists
      user.destroy
      List.count.should == 0
    end

    it "should return today's pending tasks" do
      today_pending_task = Factory(:today_pending_task)
      user = today_pending_task.list.user
      user.unfinished_tasks_due_today.should == [today_pending_task]
    end

    it "should not return today's finished tasks" do
      today_finished_task = Factory(:today_finished_task)
      user = today_finished_task.list.user
      user.unfinished_tasks_due_today.should_not include today_finished_task
    end
  end
end
