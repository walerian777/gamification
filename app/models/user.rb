class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :encryptable,
         :omniauthable

  has_many :achievements_users, dependent: :destroy
  has_many :achievements, through: :achievements_users
  has_many :teams_users, dependent: :destroy
  has_many :teams, through: :teams_users

  validates :first_name, :last_name, presence: true

  before_save :level_up, if: proc { |a| a.experience_changed? || a.new_record? }
  before_create :assign_nickname

  def name
    "#{first_name} #{last_name}"
  end

  def progress_percentage
    next_exp = experience_for_next_level
    previous_exp = experience_for_current_level
    percentage = (experience - previous_exp) / (next_exp - previous_exp) * 100
    return 0 if percentage == 100
    percentage.round(2)
  end

  def experience_for_current_level
    LevelConverter.new(self).reverse
  end

  def experience_for_next_level
    LevelConverter.new(self, next_level: true).reverse
  end

  def after_database_authentication
    return unless admin?
    AdminLogger.log("Admin #{email} logged in.")
  end

  private

  def level_up
    self.level = LevelConverter.new(self).convert.to_i
  end

  def assign_nickname
    self.nickname ||= "#{first_name.downcase}.#{last_name.downcase}"
    number = 1
    while User.where(nickname: self.nickname).exists?
      self.nickname = "#{nickname}.#{number}"
      number += 1
    end
  end
end
