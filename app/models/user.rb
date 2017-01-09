class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :encryptable,
         :omniauthable

  before_save :level_up, if: proc { |a| a.experience_changed? || a.new_record? }

  private

  def level_up
    self.level = LevelConverter.new(self).convert.to_i
  end
end
