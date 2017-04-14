class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def me
    redirect_to user_path(current_user.nickname)
  end

  def show
    @user = User.active.find_by!(nickname: params[:nickname])
    respond_with(@user)
  end

  def activity
    @user = User.find(params[:id])
    recent_query = UserRecentQuery.new(@user)
    @recent_achievements = recent_query.call(AchievementsUser.all)
    respond_to do |format|
      format.js
    end
  end
end
