class AchievementsController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def index
    @achievements = Achievement.active.order(:created_at)
                               .paginate(page: params[:page], per_page: 10)
    respond_with(@achievements)
  end

  def show
    @achievement = Achievement.active.find(params[:id])
    respond_with(@achievement)
  end

  def new
    @achievement = Achievement.new
    respond_with(@achievement)
  end

  def edit
    @achievement = Achievement.active.find(params[:id])
    respond_with(@achievement)
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      flash[:notice] = 'Achievement saved!'
      respond_with(@achievement)
    else
      render action: :new
    end
  end

  def update
    @achievement = Achievement.active.find(params[:id])
    @achievement.update(achievement_params)
    respond_with(@achievement)
  end

  def destroy
    @achievement = Achievement.active.find(params[:id])
    @achievement.destroy
    respond_with(@achievement)
  end

  private

  def achievement_params
    params.require(:achievement)
          .permit(:name, :description, :rank, :rewards, :starts_at, :ends_at)
  end
end
