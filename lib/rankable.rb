module Rankable
  extend ActiveSupport::Concern

  included do
    include Redis::Objects

    before_save :update_ranks, if: proc { |a| a.points_changed? || a.new_record? }

    sorted_set(:daily_rank, global: true)
    sorted_set(:weekly_rank, global: true)
    sorted_set(:monthly_rank, global: true)
    sorted_set(:all_time_rank, global: true)
  end

  def update_ranks
    self.class.daily_rank.increment(self.id, points - points_was)
    self.class.weekly_rank.increment(self.id, points - points_was)
    self.class.monthly_rank.increment(self.id, points - points_was)
    self.class.all_time_rank.increment(self.id, points - points_was)
  end
end
