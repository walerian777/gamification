class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :rank, null: false, default: 'bronze'
      t.integer :points, null: false
      t.string :rewards
      t.timestamp :starts_at
      t.timestamp :ends_at
      t.timestamps null: false
    end
  end
end
