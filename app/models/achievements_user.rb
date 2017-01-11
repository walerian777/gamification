class AchievementsUser < ApplicationRecord
  belongs_to :achievement
  belongs_to :user

  validates :achievement_id, :user_id, presence: true

  after_create :assing_experience

  private

  def assing_experience
    user.update_attribute(:experience, user.experience + achievement.points)
  end
end
