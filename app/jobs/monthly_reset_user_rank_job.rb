class MonthlyResetUserRankJob < ApplicationJob
  queue_as :default

  def perform
    Leaderboards::ResetRank.call(User, 'monthly')
  end
end
