class AchievementsUsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def new
    @achievements_user = AchievementsUser.new
    @achievements = Achievement.order(:name)
    @users = User.order(:last_name)
    respond_with(@achievements_user)
  end

  def create
    @achievements_user = AchievementsUser.new(achievements_user_params)
    if @achievements_user.save
      flash[:notice] = 'Achievement granted!'
      respond_with(@achievements_user.user)
    else
      render action: :new
    end
  end

  def destroy
    @achievements_user = AchievementsUser.find(params[:id])
    @achievements_user.destroy
    respond_with(@achievements_user)
  end

  private

  def achievements_user_params
    params.require(:achievements_user)
          .permit(:achievement_id, :user_id)
  end
end
