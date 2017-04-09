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

  private

  def update_ranks
    update_daily_rank
    update_weekly_rank
    update_monthly_rank
    update_all_time_rank
  end

  def update_daily_rank
    self.class.daily_rank.increment(id, points - points_was)
  end

  def update_weekly_rank
    self.class.weekly_rank.increment(id, points - points_was)
  end

  def update_monthly_rank
    self.class.monthly_rank.increment(id, points - points_was)
  end

  def update_all_time_rank
    self.class.all_time_rank.increment(id, points - points_was)
  end
end
