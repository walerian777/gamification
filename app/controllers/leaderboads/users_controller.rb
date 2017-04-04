module Leaderboards
  class UsersController < ApplicactionController
    respond_to :html

    def index
      @users = Users.call(params)
      respond_with(@users)
    end
  end
end
