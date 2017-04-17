module Leaderboards
  class UsersController < BaseController
    respond_to :html

    def index; end

    def fetch
      @users_with_scores = Users.call(leaderboard_params)
      respond_to do |format|
        format.js
      end
    end
  end
end
