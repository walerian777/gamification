class AddDescriptionColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :position, :string
    add_column :users, :location, :string
    add_column :users, :twitter, :string
    add_column :users, :github, :string
    add_column :users, :website, :string
    add_column :users, :about_me, :text
    add_column :users, :last_seen_at, :timestamp
  end
end
