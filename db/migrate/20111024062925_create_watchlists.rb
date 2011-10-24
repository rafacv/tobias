class CreateWatchlists < ActiveRecord::Migration
  def change
    create_table :watchlists do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end

    add_index :watchlists, :list_id
    add_index :watchlists, :user_id
  end
end
