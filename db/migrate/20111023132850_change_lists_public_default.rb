class ChangeListsPublicDefault < ActiveRecord::Migration
  def up
    change_column_default :lists, :public, true
  end

  def down
    change_column_default :lists, :public, nil
  end
end
