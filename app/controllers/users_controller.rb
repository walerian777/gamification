class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource
  skip_authorize_resource only: [:activity, :profile, :achievements, :teams]
  before_action :set_user_profile, only: [:activity, :profile, :achievements, :teams]

  def me
    redirect_to user_path(current_user.nickname)
  end

  def show
    @user = User.active.find_by!(nickname: params[:nickname])
    respond_with(@user)
  end

  def activity
    respond_to do |format|
      format.js
    end
  end

  def profile
    respond_to do |format|
      format.js
    end
  end

  def achievements
    respond_to do |format|
      format.js
    end
  end

  def teams
    respond_to do |format|
      format.js
    end
  end

  private

  def set_user_profile
    user = User.find(params[:id])
    @user_profile = UserProfile.new(user)
  end
end
