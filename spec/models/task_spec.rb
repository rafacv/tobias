require 'spec_helper'

describe Task do
  context "validations" do
    it "should not allow listless tasks" do
      task = Factory.build(:xmas_gifts, :list_id => nil)
      task.save.should be_false
      task.errors[:list_id].should == ["can't be blank"]
    end

    it "should not allow tasks without name" do
      task = Factory.build(:xmas_gifts, :name => "")
      task.save.should be_false
      task.errors[:name].should == ["can't be blank"]
    end
  end
end
