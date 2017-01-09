class CreateJoinTableAchievementsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :achievements, :users do |t|
      t.uuid :id, null: false, default: 'uuid_generate_v4()'
      t.uuid :achievement_id, null: false
      t.uuid :user_id, null: false
      t.timestamps null: false
      t.index [:achievement_id, :user_id]
      t.index :achievement_id
      t.index :user_id
    end

    add_foreign_key :achievements_users, :achievements, name: 'achievements_users_achievements_fk'
    add_foreign_key :achievements_users, :users, name: 'achievements_users_users_fk'
  end
end
