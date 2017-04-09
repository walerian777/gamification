module Leaderboards
  class BaseController < ApplicationController
    private

    def leaderboard_params
      params.permit(:period, :page).to_hash.symbolize_keys
    end
  end
end
