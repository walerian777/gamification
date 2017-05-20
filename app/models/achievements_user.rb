class AchievementsUser < ApplicationRecord
  belongs_to :achievement
  belongs_to :user

  validates :achievement_id, :user_id, presence: true

  after_create_commit :assing_experience, :create_notification

  private

  def assing_experience
    user.update_attribute(:experience, user.experience + achievement.points)
  end

  def create_notification
    Notification.create(user_id: user_id, notificable: achievement, message: 'Achievement Unlocked!')
  end
end
