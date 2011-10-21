class ChangeDefaultOfFinishedOnTasks < ActiveRecord::Migration
  def up
    change_column_default(:tasks, :finished, false)
  end

  def down
    change_column_default(:tasks, :finished, nil)
  end
end
