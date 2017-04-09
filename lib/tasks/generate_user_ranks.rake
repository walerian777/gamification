namespace :generate_user_ranks do
  desc 'Generating daily users rank.'
  task daily: :environment do
    AchievementsUser.joins(:achievement).where('achievements_users.created_at > ?', Time.current.beginning_of_day)
                    .group(:user_id).sum('achievements.points').each do |id, score|
      User.daily_rank.add(id, score)
    end
  end

  desc 'Generating weekly users rank.'
  task weekly: :environment do
    AchievementsUser.joins(:achievement).where('achievements_users.created_at > ?', Time.current.beginning_of_week)
                    .group(:user_id).sum('achievements.points').each do |id, score|
        User.weekly_rank.add(id, score)
    end
  end

  desc 'Generating monthly users rank.'
  task monthly: :environment do
    AchievementsUser.joins(:achievement).where('achievements_users.created_at > ?', Time.current.beginning_of_month)
                    .group(:user_id).sum('achievements.points').each do |id, score|
        User.monthly_rank.add(id, score)
    end
  end

  desc 'Generating all time users rank.'
  task all_time: :environment do
    User.all.each do |user|
      User.all_time_rank.add(user.id, user.experience)
    end
  end
end
