class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: true
      t.timestamps null: false
    end

    create_join_table :teams, :users do |t|
      t.uuid :id, null: false, default: 'uuid_generate_v4()'
      t.uuid :team_id, null: false
      t.uuid :user_id, null: false
      t.boolean :active, null: false, default: true
      t.timestamps null: false
      t.index [:team_id, :user_id], unique: true
      t.index :team_id
      t.index :user_id
    end

    add_foreign_key :teams_users, :teams, name: 'teams_users_teams_fk'
    add_foreign_key :teams_users, :users, name: 'teams_users_users_fk'

    # Added `active` column to every table.
    add_column :users, :active, :boolean, null: false, default: true
    add_column :achievements, :active, :boolean, null: false, default: true
    add_column :achievements_users, :active, :boolean, null: false, default: true
  end
end
