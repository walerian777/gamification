class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def me
    redirect_to user_path(current_user.nickname)
  end

  def show
    @user = User.active.find_by!(nickname: params[:nickname])
    recent_query = UserRecentQuery.new(@user)
    @recent_achievements = recent_query.call(AchievementsUser.all)
    @recent_teams = recent_query.call(TeamsUser.all)
    respond_with(@user)
  end
end
