class ChartsController < ApplicationController
  def points_per_day
    data = Achievement.joins(:achievements_users)
                      .where('achievements_users.user_id = ?', params[:user_id])
                      .group_by_day('achievements_users.created_at').sum(:points)
    render json: data
  end
end
