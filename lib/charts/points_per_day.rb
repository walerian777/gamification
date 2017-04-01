module Charts
  class PointsPerDay
    attr_reader :user_id

    def initialize(user_id)
      @user_id = user_id
    end

    def call
      Achievement.joins(:achievements_users).where('achievements_users.user_id = ?', user_id)
                 .group_by_day('achievements_users.created_at').sum(:points)
    end
  end
end
