class WeeklyResetUserRankJob < ApplicationJob
  queue_as :default

  def perform
    Leaderboards::ResetRank.call(klass: User, period: 'weekly')
  end
end
