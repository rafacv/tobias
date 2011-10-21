class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :finished
      t.datetime :due_on
      t.integer :list_id

      t.timestamps
    end

    add_index :tasks, :finished
    add_index :tasks, :list_id
  end
end
