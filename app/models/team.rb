class Team < ApplicationRecord
  has_many :teams_users, dependent: :destroy, inverse_of: :team
  has_many :users, through: :teams_users

  validates :name, presence: true
  validates :name, length: { maximum: 255 }

  accepts_nested_attributes_for :teams_users, allow_destroy: true
end
