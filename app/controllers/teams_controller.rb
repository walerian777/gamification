class TeamsController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def index
    @teams = Team.active.order(:created_at)
                 .paginate(page: params[:page], per_page: 10)
    respond_with(@teams)
  end

  def show
    @team = Team.active.find(params[:id])
    @users = @team.users.active.order(:last_name)
    respond_with(@team)
  end

  def new
    @team = Team.new
    @users = User.active.order(:last_name)
    @team.teams_users.build
    respond_with(@team)
  end

  def edit
    @team = Team.active.find(params[:id])
    @users = User.active.order(:last_name)
    respond_with(@team)
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = 'Team saved!'
      respond_with(@team)
    else
      render action: :new
    end
  end

  def update
    @team = Team.active.find(params[:id])
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team = Team.active.find(params[:id])
    @team.destroy
    respond_with(@team)
  end

  private

  def team_params
    params.require(:team).permit(:name, teams_users_attributes: [:user_id, :_destroy])
  end
end
