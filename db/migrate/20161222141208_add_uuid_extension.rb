class AddUuidExtension < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    SQL
  end

  def down
    execute <<-SQL
      DROP EXTENSION 'uuid-ossp';
    SQL
  end
end
