class AchievementsUser < ApplicationRecord
  belongs_to :achievement
  belongs_to :user

  validates :achievement_id, :user_id, presence: true
end
