class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def me
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end
end
