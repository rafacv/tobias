require 'spec_helper'

describe User do
  let(:user) { Factory.build(:bob) }
  let!(:today_pending_task) { Factory(:today_pending_task) }
  let!(:today_finished_task) { Factory(:today_finished_task) }

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
    it "should return today's pending tasks" do
      user = today_pending_task.list.user
      user.unfinished_tasks_due_today.should == [today_pending_task]
    end

    it "should not return today's finished tasks" do
      user = today_finished_task.list.user
      user.unfinished_tasks_due_today.should_not include today_finished_task
    end
  end
end
