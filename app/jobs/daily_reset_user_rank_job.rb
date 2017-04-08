class DailyResetUserRankJob < ApplicationJob
  queue_as :default

  def perform
    Leaderboards::ResetRank.call(klass: User, period: 'daily')
  end
end
