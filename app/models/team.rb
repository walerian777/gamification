class Team < ApplicationRecord
  has_many :teams_users, dependent: :destroy
  has_many :users, through: :teams_users

  validates :name, presence: true
  validates :name, length: { maximum: 255 }
end
