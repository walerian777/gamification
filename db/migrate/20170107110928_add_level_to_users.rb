class AddLevelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :level, :integer, null: false, default: 1
    add_column :users, :experience, :integer, null: false, default: 0
  end
end
