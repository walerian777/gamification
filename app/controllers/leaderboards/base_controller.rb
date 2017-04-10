module Leaderboards
  class BaseController < ApplicationController
    before_action :set_periods

    private

    def leaderboard_params
      params.permit(:period, :page).to_hash.symbolize_keys
    end

    def set_periods
      @periods ||= Rankable::PERIODS.map { |p| [p.humanize, p] }
    end
  end
end
