module Leaderboards
  class UsersController < ApplicationController
    respond_to :html

    def index
      @users_with_scores = Users.call(params)
      respond_with(@users_with_scores)
    end
  end
end
