class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notificable, polymorphic: true

  after_create_commit { NotificationBroadcastJob.perform_later(id) }

  scope :seen, -> { where(seen: true) }
  scope :unseen, -> { where(seen: false) }
end
