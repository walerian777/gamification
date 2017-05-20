class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.references :notificable, type: :uuid, polymorphic: true, index: true
      t.string :message
      t.boolean :seen
      t.boolean :active, null: false, default: true
      t.timestamps
    end
  end
end
