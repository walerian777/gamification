class AddPrimaryKeysToJoinTables < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE achievements_users ADD PRIMARY KEY (id);
      ALTER TABLE teams_users ADD PRIMARY KEY (id);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE achievements_users DROP CONSTRAINT achievements_users_pkey;
      ALTER TABLE teams_users DROP CONSTRAINT teams_users_pkey;
    SQL
  end
end
