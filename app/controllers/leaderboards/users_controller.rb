module Leaderboards
  class UsersController < BaseController
    respond_to :html

    def index
      @users_with_scores = Users.call(leaderboard_params)
      respond_with(@users_with_scores)
    end
  end
end
