class DailyResetUserRankJob < ApplicationJob
  queue_as :default

  def perform
    Leaderboards::ResetRank.call(User, 'daily')
  end
end
