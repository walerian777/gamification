class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.order(:created_at)
                               .paginate(page: params[:page], per_page: 10)
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  def new
    @achievement = Achievement.new
  end

  def edit
    @achievement = Achievement.find(params[:id])
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      flash[:notice] = 'Achievement saved!'
    else
      render action: :new
    end
  end

  def update
    @achievement = Achievement.find(params[:id])
    @achievement.update(achievement_params)
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy
  end

  private

  def achievement_params
    params.require(:achievement)
          .permit(:name, :description, :rank, :rewards, :starts_at, :ends_at)
  end
end
