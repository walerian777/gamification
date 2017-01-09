class Achievement < ApplicationRecord
  RANKS = {
    'bronze' => 20,
    'silver' => 40,
    'gold' => 120
  }.freeze

  validates :name, :rank, :description, presence: true
  validates :name, :rank, :rewards, length: { maximum: 255 }
  validates :points,
            numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :rank, inclusion: { in: RANKS.keys }

  before_validation :set_points, if: proc { |a| a.rank_changed? || a.new_record? }

  private

  def set_points
    self.points = RANKS[rank]
  end
end
