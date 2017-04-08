class WeeklyResetUserRankJob < ApplicationJob
  queue_as :default

  def perform
    Leaderboards::ResetRank.call(User, 'weekly')
  end
end
