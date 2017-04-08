require "#{path}/config/environment"

set :output, "#{path}/log/cron.log"
set :environment, Rails.env

job_type :sidekiq, 'cd :path && :environment_variable=:environment bundle exec sidekiq-client -q :queue push :task :output'
every :day do
  sidekiq 'DailyResetUserRankJob', queue: DailyResetUserRankJob.queue_as
end

every :monday do
  sidekiq 'WeeklyResetUserRankJob', queue: WeeklyResetUserRankJob.queue_as
end

every :month do
  sidekiq 'MonthlyResetUserRankJob', queue: MonthlyResetUserRankJob.queue_as
end
