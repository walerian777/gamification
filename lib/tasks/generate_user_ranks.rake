namespace :generate_user_ranks do
  desc 'Generating daily users rank.'
  task daily: :environment do
    daily_rank
  end

  desc 'Generating weekly users rank.'
  task weekly: :environment do
    weekly_rank
  end

  desc 'Generating monthly users rank.'
  task monthly: :environment do
    monthly_rank
  end

  desc 'Generating all time users rank.'
  task all_time: :environment do
    all_time_rank
  end

  task all: :environment do
    daily_rank
    weekly_rank
    monthly_rank
    all_time_rank
  end

  def daily_rank
    AchievementsUser.joins(:achievement).where('achievements_users.created_at > ?', Time.current.beginning_of_day)
                    .group(:user_id).sum('achievements.points').each do |id, score|
      User.daily_rank.add(id, score)
    end
  end

  def weekly_rank
    AchievementsUser.joins(:achievement).where('achievements_users.created_at > ?', Time.current.beginning_of_week)
                    .group(:user_id).sum('achievements.points').each do |id, score|
      User.weekly_rank.add(id, score)
    end
  end

  def monthly_rank
    AchievementsUser.joins(:achievement).where('achievements_users.created_at > ?', Time.current.beginning_of_month)
                    .group(:user_id).sum('achievements.points').each do |id, score|
      User.monthly_rank.add(id, score)
    end
  end

  def all_time_rank
    User.all.each do |user|
      User.all_time_rank.add(user.id, user.experience)
    end
  end
end
