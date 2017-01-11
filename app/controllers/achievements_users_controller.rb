class AchievementsUsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def new
    @achievements_user = AchievementsUser.new
    @achievements = Achievement.active.order(:name)
    @users = User.active.order(:last_name)
    respond_with(@achievements_user)
  end

  def create
    @achievements_user = AchievementsUser.new(achievements_user_params)
    if @achievements_user.save
      flash[:notice] = 'Achievement granted!'
      redirect_to show_user_path(nickname: @achievements_user.user.nickname)
    else
      render action: :new
    end
  end

  def destroy
    @achievements_user = AchievementsUser.active.find(params[:id])
    @achievements_user.destroy
    respond_with(@achievements_user)
  end

  private

  def achievements_user_params
    params.require(:achievements_user)
          .permit(:achievement_id, :user_id)
  end
end
