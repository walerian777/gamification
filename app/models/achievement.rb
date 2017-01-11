class Achievement < ApplicationRecord
  RANKS = {
    'bronze' => 20,
    'silver' => 40,
    'gold' => 120
  }.freeze

  has_many :achievements_users, dependent: :destroy
  has_many :users, through: :achievements_users

  scope :gold, -> { where(rank: 'gold') }
  scope :silver, -> { where(rank: 'silver') }
  scope :bronze, -> { where(rank: 'bronze') }

  validates :name, :rank, :description, presence: true
  validates :name, :rank, :rewards, length: { maximum: 255 }
  validates :points,
            numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :rank, inclusion: { in: RANKS.keys }

  before_validation :assign_points, if: proc { |a| a.rank_changed? || a.new_record? }

  private

  def assign_points
    self.points = RANKS[rank]
  end
end
