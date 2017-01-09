class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :encryptable,
         :omniauthable

  validates :first_name, :last_name, presence: true

  before_save :level_up, if: proc { |a| a.experience_changed? || a.new_record? }
  before_create :assign_nickname

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
