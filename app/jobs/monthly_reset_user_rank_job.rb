class MonthlyResetUserRankJob < ApplicationJob
  queue_as :default

  def perform
    Leaderboards::ResetRank.call(klass: User, period: 'monthly')
  end
end
